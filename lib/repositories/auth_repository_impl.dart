import 'package:bibliotech_admin/config/auth/auth_api.dart';
import 'package:bibliotech_admin/config/helpers/login_response.dart';
import 'package:bibliotech_admin/repositories/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthAPI _api;

  AuthenticationRepositoryImpl(this._api);

  @override
  Future<String?> get accessToken async {
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    return _api.login(email, password);
  }
}
