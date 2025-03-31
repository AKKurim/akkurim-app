import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supertokens_flutter/supertokens.dart';
import '../../models/role_enum.dart';
import '../network/api_service.dart';

part 'auth_service.g.dart';

class AuthState {
  final AuthStateEnum state;
  final RoleEnum role;
  String? error;
  AuthState(this.state, this.role, {this.error});
}

enum AuthStateEnum {
  initial,
  loading,
  authenticated,
  error,
}

@riverpod
class AuthService extends _$AuthService {
  @override
  AuthState build() {
    state = AuthState(AuthStateEnum.initial, RoleEnum.unknown);
    Future.wait([
      SuperTokens.doesSessionExist(),
      SuperTokens.getAccessTokenPayloadSecurely(),
    ]).then((value) {
      bool sessionExists = value[0] as bool;
      Map<String, dynamic> accessTokenPayload =
          value[1] as Map<String, dynamic>;
      if (sessionExists) {
        // String role = accessTokenPayload["role"];
        // RoleEnum roleEnum = RoleEnum.values
        //     .firstWhere((e) => e.toString().split('.')[1] == role);
        RoleEnum roleEnum = RoleEnum.trainer;
        state = AuthState(AuthStateEnum.authenticated, roleEnum);
        // TODO change the role seleciton
      } else {
        state = AuthState(AuthStateEnum.initial, RoleEnum.unknown);
      }
    });
    return state;
  }

  Future<void> login({required String email, required String password}) async {
    state = AuthState(AuthStateEnum.loading, RoleEnum.unknown);
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
      print(error);
      return Response(
        requestOptions: RequestOptions(path: ""),
        statusCode: 500,
        statusMessage: "Network or server error",
      );
    });
    if (res.statusCode != 200) {
      state = AuthState(AuthStateEnum.error, RoleEnum.unknown,
          error: res.statusMessage);
      return;
    }
    // kinda stupid imo but the response returns a 200 even if the credentials are wrong

    Map<String, dynamic> body = res.data;
    if (body["status"]!.contains("ERROR")) {
      if (body["status"]!.contains("WRONG_CREDENTIALS_ERROR")) {
        state = AuthState(AuthStateEnum.error, RoleEnum.unknown,
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
          AuthState(AuthStateEnum.error, RoleEnum.unknown, error: errorString);
    } else {
      print(SuperTokens.doesSessionExist());
      // Map<String, dynamic> accessTokenPayload =
      //     await SuperTokens.getAccessTokenPayloadSecurely().onError(
      //   (error, stackTrace) {
      //     print(error);
      //     state = AuthState(AuthStateEnum.error, RoleEnum.unknown,
      //         error: "Error getting access token payload");
      //     return {};
      //   },
      // );
      // String role = accessTokenPayload["role"];
      // TODO fix this I guess?
      String role = 'trainer';
      print(RoleEnum.trainer.toString());
      RoleEnum roleEnum =
          RoleEnum.values.firstWhere((e) => e.toString().split('.')[1] == role);
      state = AuthState(AuthStateEnum.authenticated, roleEnum);
    }
  }

  Future<void> logout() async {
    await SuperTokens.signOut();
    state = AuthState(AuthStateEnum.initial, RoleEnum.unknown);
  }
}
