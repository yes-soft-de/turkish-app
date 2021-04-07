import 'package:hersay/module_home/response/all_cars/all_cars_response.dart';
import 'package:hersay/module_home/response/all_devices/all_devices_response.dart';
import 'package:hersay/module_home/response/all_real_estates/all_real_estates_response.dart';
import 'package:hersay/module_home/response/all_services/all_advertisement.dart';

class HomeResponse {
  AllDevicesResponse electronicDevices;
  AllCarsResponse cars;
  AllRealEstatesResponse realEstates;
  AllAdvertisementResponse allAdvertisement;
  HomeResponse({
    this.cars,
    this.realEstates,
    this.electronicDevices,
    this.allAdvertisement
  });
}
