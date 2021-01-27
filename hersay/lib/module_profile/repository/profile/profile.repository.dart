
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_profile/response/profile/profile_response.dart';
import 'package:inject/inject.dart';

@provide
class ProfileRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ProfileRepository(
      this._apiClient,
      this._authService,
      );

  Future<ProfileResponse> getProfile()async{
    var token = await _authService.getToken();
    var response = await _apiClient.get(
        Urls.PROFILE,
        headers: {'Authorization':'Bearer '+token}
        );

    if(response ==  null) return null;
    return ProfileResponse.fromJson(response);
  }
}