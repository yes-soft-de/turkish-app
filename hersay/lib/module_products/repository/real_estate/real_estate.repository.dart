
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:inject/inject.dart';

@provide
class RealEstateRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  RealEstateRepository(
      this._apiClient,
      this._authService,
      );

  Future<bool> addNewRealEstate(RealEstateRequest realEstateRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.ADD_NEW_REAL_ESTATE,
      realEstateRequest.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );

    if (response == null) return false;

    return response['status_code'] == '201' ? true : false;
  }

}