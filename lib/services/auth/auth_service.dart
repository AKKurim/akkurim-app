import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supertokens_flutter/supertokens.dart';
import '../../models/auth/role_enum.dart';
import '../network/api_service.dart';
import '../../models/auth/progress_enum.dart';
import '../../models/auth/auth_state.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  String _getTenantFromToken({required Map<String, dynamic> tokenPayload}) {
    assert(tokenPayload['st-role']['v']!.length == 1);
    return tokenPayload['st-role']['v'][0]!.split('_')[0];
  }

  RoleEnum _getRoleFromToken({required Map tokenPayload}) {
    assert(tokenPayload['st-role']['v']!.length == 1);
    final roleStr = tokenPayload['st-role']['v'][0]!.split('_')[1];
    return RoleEnum.values
        .firstWhere((e) => e.toString().split('.')[1] == roleStr);
  }

  @override
  AuthState build() {
    state = AuthState(ProgressEnum.initial, RoleEnum.unknown);
    // Future.wait([
    //   SuperTokens.doesSessionExist(),
    //   SuperTokens.getAccessTokenPayloadSecurely()
    // ]).then((value) {
    //   final bool sessionExists = value[0] as bool;
    //   final Map<String, dynamic> accessTokenPayload =
    //       value[1] as Map<String, dynamic>;

    //   if (sessionExists) {
    //     state = AuthState(
    //       ProgressEnum.authenticated,
    //       _getRoleFromToken(tokenPayload: accessTokenPayload),
    //       tenant: _getTenantFromToken(tokenPayload: accessTokenPayload),
    //     );
    //   } else {
    //     state = AuthState(ProgressEnum.initial, RoleEnum.unknown);
    //   }
    // });

    return state;
  }

  Future<void> login({required String email, required String password}) async {
    state = AuthState(ProgressEnum.loading, RoleEnum.unknown);
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
      state = AuthState(ProgressEnum.error, RoleEnum.unknown,
          error: res.statusMessage);
      return;
    }
    // kinda stupid imo but the response returns a 200 even if the credentials are wrong

    Map<String, dynamic> body = res.data;
    if (body["status"]!.contains("ERROR")) {
      if (body["status"]!.contains("WRONG_CREDENTIALS_ERROR")) {
        state = AuthState(ProgressEnum.error, RoleEnum.unknown,
            error: "Wrong credentials");
        return;
      }
      String errorString = "";
      for (Map<String, dynamic> error in body["formFields"]!) {
        if (error["error"] != null) {
          errorString += "${error["id"]}: ${error["error"]}!\n";
        }
      }
      state =
          AuthState(ProgressEnum.error, RoleEnum.unknown, error: errorString);
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
        state = AuthState(
          ProgressEnum.authenticated,
          _getRoleFromToken(tokenPayload: accessTokenPayload),
          tenant: _getTenantFromToken(tokenPayload: accessTokenPayload),
        );
      });
    }
  }

  Future<void> logout() async {
    await SuperTokens.signOut();
    state = AuthState(ProgressEnum.initial, RoleEnum.unknown);
  }
}
