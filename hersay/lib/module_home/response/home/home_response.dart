import 'package:flutter/foundation.dart';
import 'package:hersay/module_home/response/all_cars/all_cars_response.dart';
import 'package:hersay/module_home/response/all_devices/all_devices_response.dart';
import 'package:hersay/module_home/response/all_real_estates/all_real_estates_response.dart';
import 'package:hersay/module_home/response/all_services/all_advertisement.dart';
import 'package:hersay/module_home/response/category/category.dart';

class HomeResponse {
  AllDevicesResponse electronicDevices;
  AllCarsResponse cars;
  AllRealEstatesResponse realEstates;
  AllAdvertisementResponse allAdvertisement;
  CategoryResponse categoryResponse;
  HomeResponse(
      {this.cars,
      this.realEstates,
      this.electronicDevices,
      this.allAdvertisement,
      this.categoryResponse
      });
}
