
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_search/response/search/search_response.dart';
import 'package:inject/inject.dart';

@provide
class SearchRepository{
  final AuthService _authService;
  final ApiClient _apiClient;

  SearchRepository(
      this._apiClient,
      this._authService,
      );


  Future<SearchResponse> search(String searchQuery)async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.SEARCH + '$searchQuery',
        headers: {'Authorization': 'Bearer ' + token},
    );
    if(response == null) return null;

    return SearchResponse.fromJson(response);
  }
}