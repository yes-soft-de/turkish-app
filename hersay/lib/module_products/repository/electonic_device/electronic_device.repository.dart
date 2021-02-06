
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart'; 
import 'package:hersay/module_products/request/electonic_device/electronic_device_request.dart';
import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';
import 'package:inject/inject.dart';

@provide
class ElectronicDeviceRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ElectronicDeviceRepository(
      this._apiClient,
      this._authService,
      );

  Future<int> addNewElectronicDevice(ElectronicDeviceRequest electronicDeviceRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.ADD_NEW_DEVICE,
      electronicDeviceRequest.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );

    if (response == null) return null;

    return response['status_code'] == '201' ? response['Data']['id'] : null;
  }

  Future<ElectronicDeviceResponse> getElectronicDeviceDetails(int electronicDeviceId)async{
    var token = await _authService.getToken();
    dynamic response = (token != null)
        ? await _apiClient.get(
      Urls.GET_DEVICE_DETAILS + '$electronicDeviceId',
      headers: {'Authorization': 'Bearer ' + token},
    )
        : await _apiClient.get( Urls.GET_CAR_DETAILS + '$electronicDeviceId',) ;


    if (response == null) return null;
    return ElectronicDeviceResponse.fromJson(response);
  }
}