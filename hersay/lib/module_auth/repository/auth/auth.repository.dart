
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/request/login/login_register.dart';
import 'package:hersay/module_auth/request/register/register_request.dart';
import 'package:hersay/module_auth/response/login/login_response.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_profile/request/profile/profile_request.dart';
import 'package:hersay/module_profile/service/profile/profile.service.dart';
import 'package:inject/inject.dart';

@provide
class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(
      this._apiClient,
      );

  Future<bool> createUser(RegisterRequest request) async {
    var result = await _apiClient.post(Urls.API_SIGN_UP, request.toJson());


    return result != null;
  }

  Future<bool> createProfile(String userName,String token) async{
    print('create profile for after register the new account');
    ProfileRequest request = new ProfileRequest(
      image: '',
      userName: userName,
      location: '',
      story: '',
    );

    var response = await _apiClient.post(
        Urls.PROFILE,
        request.toJson(),
        headers: {'Authorization':'Bearer '+token}
    );

    if (response == null) return false;

    return (response['status_code'] == '201')
        ? true
        : false;
  }

  Future<LoginResponse> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.CREATE_TOKEN_API,
      loginRequest.toJson(),
    );

    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }
}