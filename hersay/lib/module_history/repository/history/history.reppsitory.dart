
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_history/response/history/history_response.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:inject/inject.dart';

@provide
class HistoryRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  HistoryRepository(
      this._authService,
      this._apiClient,
      );

  Future<HistoryResponse> getHistory()async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.HISTORY,
        headers: {'Authorization':'Bearer '+token}
    );

    if(response == null) return null;

    return HistoryResponse.fromJson(response);
  }
}