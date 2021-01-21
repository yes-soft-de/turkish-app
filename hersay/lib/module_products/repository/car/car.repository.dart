
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:inject/inject.dart';

@provide
class CarRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  CarRepository(
      this._apiClient,
      this._authService,
      );

  Future<bool> addNewCar(CarRequest carRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.ADD_NEW_CAR,
      carRequest.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );

    if (response == null) return false;

    return response['status_code'] == '201' ? true : false;
  }

}