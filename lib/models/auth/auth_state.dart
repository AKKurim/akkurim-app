import './progress_enum.dart';
import './role_enum.dart';

class AuthState {
  final ProgressEnum state;
  final RoleEnum role;
  final String? tenant;
  String? email;
  String? error;
  AuthState(this.state, this.role, {this.tenant, this.email, this.error});
}
