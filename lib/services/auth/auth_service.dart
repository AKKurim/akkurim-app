import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supertokens_flutter/supertokens.dart';
import '../../models/auth/role_enum.dart';
import '../network/api_service.dart';
import '../../models/auth/progress_enum.dart';
import '../../models/auth/auth_state.dart';
import '../../providers/db_provider.dart';
import '../../providers/app_settings_provider.dart';
import '../database/drift_database.dart';
import 'package:drift/drift.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  String _getTenantFromToken({required Map<String, dynamic> tokenPayload}) {
    for (String userRole in tokenPayload['st-role']['v']) {
      if (userRole.startsWith("tenant-")) {
        return userRole.split('-')[1];
      }
    }
    throw Exception("No tenant found in token payload");
  }

  List<RoleEnum> _getRolesFromToken({required Map tokenPayload}) {
    List<RoleEnum> roles = [];
    for (String userRole in tokenPayload['st-role']['v']) {
      if (userRole.startsWith("role-")) {
        roles.add(roleFromString(userRole.split('-')[1]));
      }
    }
    return roles;
  }

  @override
  Future<AuthState> build() async {
    final db = ref.read(dbProvider);
    final bool sessionExists = await SuperTokens.doesSessionExist();
    if (!sessionExists) {
      return AuthState(ProgressEnum.initial, []);
    }

    final Map<String, dynamic> accessTokenPayload =
        await SuperTokens.getAccessTokenPayloadSecurely();
    final String tenant = _getTenantFromToken(tokenPayload: accessTokenPayload);
    final List<RoleEnum> roles =
        _getRolesFromToken(tokenPayload: accessTokenPayload);
    String? email;
    try {
      email = await (db.select(db.userEmail)
            ..orderBy([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull()
          .then((value) => value?.email);
      if (email != null) {
        await OneSignal.login(email);
      }
    } catch (e) {
      print("Error getting email from database: $e");
    }

    return AuthState(
      ProgressEnum.authenticated,
      roles,
      tenant: tenant,
      email: email,
    );
  }

  Future<void> login({required String email, required String password}) async {
    state =
        AsyncValue.data(AuthState(ProgressEnum.loading, [RoleEnum.unknown]));
    ApiService apiService = ApiService.instance;

    var res = await apiService.postRequest(
      "/auth/signin",
      data: {
        "formFields": [
          {"id": "email", "value": email},
          {"id": "password", "value": password},
        ],
      },
    ).onError((error, stackTrace) {
      return Response(
        requestOptions: RequestOptions(path: ""),
        statusCode: 500,
        statusMessage: "Network or server error",
      );
    });
    if (res.statusCode != 200) {
      state = AsyncValue.data(
          AuthState(ProgressEnum.error, [], error: res.statusMessage));
      return;
    }
    // kinda stupid imo but the response returns a 200 even if the credentials are wrong
    // check for for errors in the response body
    Map<String, dynamic> body = res.data;
    if (body["status"]!.contains("ERROR")) {
      if (body["status"]!.contains("WRONG_CREDENTIALS_ERROR")) {
        state = AsyncValue.data(AuthState(
            ProgressEnum.error, [RoleEnum.unknown],
            error: "Wrong credentials"));
        return;
      }
      String errorString = "";
      for (Map<String, dynamic> error in body["formFields"]!) {
        if (error["error"] != null) {
          errorString += "${error["id"]}: ${error["error"]}!\n";
        }
      }
      state = AsyncValue.data(
          AuthState(ProgressEnum.error, [], error: errorString));
      return;
    }

    // actual successful login is here
    final bool sessionExists = await SuperTokens.doesSessionExist();
    assert(sessionExists, "Session should exist after successful login");
    final Map<String, dynamic> accessTokenPayload =
        await SuperTokens.getAccessTokenPayloadSecurely();
    final String tenant = _getTenantFromToken(tokenPayload: accessTokenPayload);
    final List<RoleEnum> roles =
        _getRolesFromToken(tokenPayload: accessTokenPayload);

    final FlutterSecureStorage storage = FlutterSecureStorage();
    final String? storedEmail = await storage.read(key: "email");
    if (storedEmail != null && storedEmail != email) {
      // if the email is different, we need to clear preferences of using fingerprint
      final appSettings = ref.read(appSettingsPProvider.notifier);
      appSettings.updateUseFingerprint(null);
    }
    await storage.write(
      key: "email",
      value: email,
    );
    await storage.write(
      key: "password",
      value: password,
    );

    state = AsyncValue.data(
      AuthState(
        ProgressEnum.authenticated,
        roles,
        tenant: tenant,
        email: email,
      ),
    );
    await promptForBiometricSave(
        localizedReason: 'Authenticate to login',
        androidTitle: 'Biometric Authentication',
        cancelButton: 'cancel');

    final db = ref.read(dbProvider);
    await db.into(db.userEmail).insert(
          UserEmailCompanion(
            email: Value(email),
          ),
          mode: InsertMode.insertOrReplace,
        );

    await OneSignal.login(email);
  }

  Future<void> logout() async {
    state = AsyncValue.data(
      AuthState(
          state.value?.state ?? ProgressEnum.loading, state.value?.roles ?? [],
          tenant: state.value?.tenant, email: state.value?.email),
    );
    await SuperTokens.signOut();
    await OneSignal.logout();
    state = AsyncValue.data(AuthState(ProgressEnum.initial, []));
  }

  Future<void> promptForBiometricSave({
    required String localizedReason,
    required String androidTitle,
    required String cancelButton,
    bool fromSettings = false,
  }) async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (!canAuthenticateWithBiometrics || availableBiometrics.isEmpty) {
      return;
    }

    final FlutterSecureStorage storage = FlutterSecureStorage();
    final String? useFingerprint = await storage.read(key: "useFingerprint");
    if (useFingerprint != null && !fromSettings) {
      return;
    }
    bool? didAuthenticate = false;
    try {
      didAuthenticate = await auth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          useErrorDialogs: false,
          biometricOnly: true,
        ),
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: androidTitle,
            cancelButton: cancelButton,
          ),
          IOSAuthMessages(
            cancelButton: cancelButton,
          ),
        ],
      );
    } on PlatformException catch (e) {
      // Handle the exception if the user cancels the authentication
      print("Authentication error: $e");
      didAuthenticate = null;
    }
    final appSettings = ref.read(appSettingsPProvider.notifier);
    didAuthenticate =
        !fromSettings ? didAuthenticate : didAuthenticate ?? false;
    appSettings.updateUseFingerprint(didAuthenticate ?? false);
  }

  Future<void> promptForBiometricLogin({
    required String localizedReason,
    required String androidTitle,
    required String cancelButton,
  }) async {
    // check if state is initial if it isnt skip

    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (!canAuthenticateWithBiometrics || availableBiometrics.isEmpty) {
      return;
    }

    final FlutterSecureStorage storage = FlutterSecureStorage();
    final String? useFingerprint = await storage.read(key: "useFingerprint");
    if (useFingerprint == null || useFingerprint != "true") {
      // if the user has not enabled fingerprint authentication
      return;
    }
    bool didAuthenticate = false;
    try {
      didAuthenticate = await auth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          useErrorDialogs: false,
          biometricOnly: true,
        ),
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: androidTitle,
            cancelButton: cancelButton,
          ),
          IOSAuthMessages(
            cancelButton: cancelButton,
          ),
        ],
      );
    } on PlatformException {
      // Handle the exception if the user cancels the authentication
      didAuthenticate = false;
    }
    if (!didAuthenticate) {
      return;
    }

    // if the user has successfully authenticated, we can log them in
    final String? email = await storage.read(key: "email");
    final String? password = await storage.read(key: "password");
    if (email == null || password == null) {
      return;
    }
    await login(email: email, password: password);
  }
  // TODO fix the initial promp for biometric login
// TODO add to setting to enable/disable biometric login
}
