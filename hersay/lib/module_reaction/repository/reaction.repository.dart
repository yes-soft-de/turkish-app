
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_reaction/request/reaction_request.dart';
import 'package:inject/inject.dart';

@provide
class ReactionRepository{
  final AuthService _authService;
  final ApiClient _apiClient;

  ReactionRepository(
      this._apiClient,
      this._authService,
      );

  Future<void> react(ReactionRequest request)async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
        Urls.REACT,
        request.toJson(),
       headers: {'Authorization':'Bearer '+token}
    );

    return (response['status_code']=='201')? true : false;

  }
}