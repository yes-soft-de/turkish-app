import 'package:flutter/foundation.dart';
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_home/response/all_cars/all_cars_response.dart';
import 'package:hersay/module_home/response/all_devices/all_devices_response.dart';
import 'package:hersay/module_home/response/all_real_estates/all_real_estates_response.dart';
import 'package:hersay/module_home/response/all_services/all_advertisement.dart';
import 'package:hersay/module_home/response/category/category.dart';
import 'package:hersay/module_home/response/home/home_response.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:inject/inject.dart';

AllCarsResponse cars;
AllDevicesResponse devices;
AllRealEstatesResponse realEstates;
AllAdvertisementResponse advertisement;
CategoryResponse categoryResponse;

@provide
class HomeRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  HomeRepository(
    this._apiClient,
    this._authService,
  );

  Future<HomeResponse> getHomeScreenData() async {
    await Future.wait([
      _getAllCars(),
      _getAllElectronicDevices(),
      _getAllRealEstates(),
      _getAllAdvertisements(),
      _getCategories()
    ]);

    HomeResponse result = new HomeResponse(
        cars: cars,
        electronicDevices: devices,
        realEstates: realEstates,
        allAdvertisement: advertisement,
        categoryResponse: categoryResponse
        );

    return result;
  }

  Future<void> _getAllRealEstates() async {
    var token = await _authService.getToken();
    dynamic response = (token != null)
        ? await _apiClient.get(
            Urls.ALL_REAL_ESTATES,
            headers: {'Authorization': 'Bearer ' + token},
          )
        : await _apiClient.get(
            Urls.ALL_REAL_ESTATES,
          );

    if (response != null)
      realEstates = AllRealEstatesResponse.fromJson(response);
  }
  Future<void> _getCategories() async {
    var token = await _authService.getToken();
    dynamic response = (token != null)
        ? await _apiClient.get(
            Urls.GET_CATEGORIES,
            headers: {'Authorization': 'Bearer ' + token},
          )
        : await _apiClient.get(
            Urls.GET_CATEGORIES,
          );

    if (response != null)
      categoryResponse = CategoryResponse.fromJson(response);
  }

  Future<void> _getAllCars() async {
    var token = await _authService.getToken();

    dynamic response = (token != null)
        ? await _apiClient.get(
            Urls.ALL_CARS,
            headers: {'Authorization': 'Bearer ' + token},
          )
        : await _apiClient.get(
            Urls.ALL_CARS,
          );

    if (response != null) cars = AllCarsResponse.fromJson(response);
  }

  Future<void> _getAllElectronicDevices() async {
    var token = await _authService.getToken();
    dynamic response = (token != null)
        ? await _apiClient.get(
            Urls.ALL_DEVICES,
            headers: {'Authorization': 'Bearer ' + token},
          )
        : await _apiClient.get(
            Urls.ALL_DEVICES,
          );
    if (response != null) devices = AllDevicesResponse.fromJson(response);
  }

  Future<void> _getAllAdvertisements() async {
    var token = await _authService.getToken();
    dynamic response = (token != null)
        ? await _apiClient.get(
            Urls.ADVERTISEMENT_API,
            headers: {'Authorization': 'Bearer ' + token},
          )
        : await _apiClient.get(
            Urls.ADVERTISEMENT_API,
          );
    if (response != null)
      advertisement = AllAdvertisementResponse.fromJson(response);
  }
}
