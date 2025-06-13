import './progress_enum.dart';
import './role_enum.dart';

class AuthState {
  final ProgressEnum state;
  final List<RoleEnum> roles;
  final String? tenant;
  String? email;
  String? error;
  AuthState(this.state, this.roles, {this.tenant, this.email, this.error});
}
