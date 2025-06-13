import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supertokens_flutter/supertokens.dart';
import '../../models/auth/role_enum.dart';
import '../network/api_service.dart';
import '../../models/auth/progress_enum.dart';
import '../../models/auth/auth_state.dart';
import '../../providers/db_provider.dart';
import '../database/drift_database.dart';
import 'package:drift/drift.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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
  AuthState build() {
    state = AuthState(ProgressEnum.initial, []);
    final db = ref.read(dbProvider);
    Future.wait([
      SuperTokens.doesSessionExist(),
      SuperTokens.getAccessTokenPayloadSecurely(),
      (db.select(db.userEmail)
            ..orderBy([
              (tbl) => OrderingTerm(
                    expression: tbl.id,
                    mode: OrderingMode.desc,
                  )
            ])
            ..limit(1))
          .getSingleOrNull(),
    ]).then((value) {
      final bool sessionExists = value[0] as bool;
      final Map<String, dynamic> accessTokenPayload =
          value[1] as Map<String, dynamic>;
      final UserEmailData? userEmail = value[2] as UserEmailData?;
      if (sessionExists) {
        state = AuthState(
          ProgressEnum.authenticated,
          _getRolesFromToken(tokenPayload: accessTokenPayload),
          tenant: _getTenantFromToken(tokenPayload: accessTokenPayload),
          email: userEmail?.email ?? "",
        );
        if (userEmail?.email != null) {
          Future.wait([
            OneSignal.login(userEmail!.email),
          ]);
        }
      } else {
        state = AuthState(ProgressEnum.initial, []);
      }
    });

    return state;
  }

  Future<void> login({required String email, required String password}) async {
    state = AuthState(ProgressEnum.loading, [RoleEnum.unknown]);
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
      state = AuthState(ProgressEnum.error, [], error: res.statusMessage);
      return;
    }
    // kinda stupid imo but the response returns a 200 even if the credentials are wrong

    Map<String, dynamic> body = res.data;
    if (body["status"]!.contains("ERROR")) {
      if (body["status"]!.contains("WRONG_CREDENTIALS_ERROR")) {
        state = AuthState(ProgressEnum.error, [RoleEnum.unknown],
            error: "Wrong credentials");
        return;
      }
      String errorString = "";
      for (Map<String, dynamic> error in body["formFields"]!) {
        if (error["error"] != null) {
          errorString += "${error["id"]}: ${error["error"]}!\n";
        }
      }
      state = AuthState(ProgressEnum.error, [], error: errorString);
    } else {
      // actual successful login is here
      Future.wait([
        SuperTokens.doesSessionExist(),
        SuperTokens.getAccessTokenPayloadSecurely(),
      ]).then((value) {
        final bool sessionExists = value[0] as bool;
        final Map<String, dynamic> accessTokenPayload =
            value[1] as Map<String, dynamic>;
        assert(sessionExists);
        final db = ref.read(dbProvider);
        state = AuthState(
          ProgressEnum.authenticated,
          _getRolesFromToken(tokenPayload: accessTokenPayload),
          tenant: _getTenantFromToken(tokenPayload: accessTokenPayload),
          email: email,
        );
        Future.wait([
          db.into(db.userEmail).insert(
                UserEmailCompanion(
                  email: Value(email),
                ),
                mode: InsertMode.insertOrReplace,
              ),
          OneSignal.login(email),
        ]);
      });
    }
  }

  Future<void> logout() async {
    await SuperTokens.signOut();
    await OneSignal.logout();
    state = AuthState(ProgressEnum.initial, []);
  }
}
