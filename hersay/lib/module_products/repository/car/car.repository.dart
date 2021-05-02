import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/response/car/car_response.dart';
import 'package:inject/inject.dart';

@provide
class CarRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  CarRepository(
    this._apiClient,
    this._authService,
  );

  Future<int> addNewCar(CarRequest carRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.ADD_NEW_CAR,
      carRequest.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );

    if (response == null) return null;

    return response['status_code'] == '201' ? response['Data']['id'] : null;
  }

  Future<CarResponse> getCarDetails(int carId) async {
    var token = await _authService.getToken();
    dynamic response = (token != null)
        ? await _apiClient.get(
            Urls.GET_CAR_DETAILS + '$carId',
            headers: {'Authorization': 'Bearer ' + token},
          )
        : await _apiClient.get(
            Urls.GET_CAR_DETAILS + '$carId',
          );

    if (response == null) return null;
    return CarResponse.fromJson(response);
  }

  Future<int> updateCar(CarRequest serviceRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.put(
      Urls.ADD_NEW_CAR,
      serviceRequest.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );

    if (response == null) return null;

    return response['status_code'] == '204'
        ? response['Data']['id'] ?? 1
        : null;
  }

  Future placeComment(CommentRequest request) async {
    var token = await _authService.getToken();
    var response = await _apiClient.post(
      Urls.COMMENT_API,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );
  }
}
