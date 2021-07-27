
import 'package:hersay/module_auth/repository/auth/auth.repository.dart';
import 'package:hersay/module_auth/request/login/login_register.dart';
import 'package:hersay/module_auth/request/register/register_request.dart';
import 'package:hersay/module_auth/response/login/login_response.dart';
import 'package:inject/inject.dart';

@provide
class AuthManager {
  final AuthRepository _authRepository;
  AuthManager(this._authRepository);

  Future<bool> register(RegisterRequest registerRequest) => _authRepository.createUser(registerRequest);

  Future<LoginResponse> login(LoginRequest loginRequest) => _authRepository.getToken(loginRequest);

  Future<bool> createProfile(String userName,String token) async => _authRepository.createProfile(userName,token);
}