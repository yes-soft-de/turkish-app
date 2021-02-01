import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_profile/request/profile/profile_request.dart';
import 'package:hersay/module_profile/response/all_cars/all_cars_response.dart';
import 'package:hersay/module_profile/response/all_devices/all_devices_response.dart';
import 'package:hersay/module_profile/response/all_real_estates/all_real_estates_response.dart';
import 'package:hersay/module_profile/response/profile/profile_response.dart';
import 'package:inject/inject.dart';

AllCarsResponse cars = new AllCarsResponse();
AllDevicesResponse devices = new AllDevicesResponse();
AllRealEstatesResponse realEstates = new AllRealEstatesResponse();

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


    await Future.wait([
      _getUserCars(),
      _getUserElectronicDevices(),
      _getUserRealEstates(),
    ]);


    ProfileResponse profile = ProfileResponse.fromJson(response);
    profile.cars = cars;
    profile.realEstates = realEstates;
    profile.electronicDevices = devices;

    return profile;
  }

 Future<bool> createProfile(ProfileRequest request)async{
   var token = await _authService.getToken();
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

  Future<bool> updateMyProfile(ProfileRequest request) async {
    print('from profile repository , image : ${request.image}');

    var token = await _authService.getToken();
    Map<String, dynamic> response = await _apiClient.put(
        Urls.PROFILE,
        request.toJson(),
        headers: {'Authorization':'Bearer '+token}
    );

    return response == null ? false : true;
  }

  Future<void> _getUserRealEstates()async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.GET_USER_REAL_ESTATES,
      headers: {'Authorization': 'Bearer ' + token},
    );

    if(response != null ) realEstates = AllRealEstatesResponse.fromJson(response);

  }

  Future<void> _getUserCars()async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.GET_USER_CARS,
      headers: {'Authorization': 'Bearer ' + token},
    );

    if(response != null ) cars = AllCarsResponse.fromJson(response);

  }

  Future<void> _getUserElectronicDevices()async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.GET_USER_DEVICES,
      headers: {'Authorization': 'Bearer ' + token},
    );

    if(response != null ) devices = AllDevicesResponse.fromJson(response);

  }
}