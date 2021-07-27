import 'package:flutter/material.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart';
import 'package:hersay/module_products/ui/screen/add_real_estate/add_real_estate_screen.dart';
import 'package:hersay/module_products/ui/screen/add_service/add_service_screen.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/module_products/ui/screen/product_images/product_images_screen.dart';
import 'package:hersay/module_products/ui/screen/real_estate_details/real_estate_details_screen.dart';
import 'package:hersay/module_products/ui/screen/service_details/service_details.dart';
import 'package:inject/inject.dart';

@provide
@singleton
class ProductsModule extends YesModule {
  final AddRealEstateScreen _addRealEstateScreen;
  final AddCarScreen _addCarScreen;
  final AddElectronicDeviceScreen _addElectronicDeviceScreen;
  final AddServiceScreen _addServiceScreen;
  final CarDetailsScreen _carDetailsScreen;
  final RealEstateDetailsScreen _realEstateDetailsScreen;
  final ElectronicDeviceDetailsScreen _electronicDeviceDetailsScreen;
  final ProductImagesScreen _productImagesScreen;
  final ServiceDetailsScreen _serviceDetailsScreen;
  ProductsModule(
      this._addRealEstateScreen,
      this._addCarScreen,
      this._addElectronicDeviceScreen,
      this._addServiceScreen,
      this._electronicDeviceDetailsScreen,
      this._realEstateDetailsScreen,
      this._carDetailsScreen,
      this._productImagesScreen,
      this._serviceDetailsScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProductsRoutes.ADD_REAL_ESTATE_SCREEN: (context) => _addRealEstateScreen,
      ProductsRoutes.ADD_CAR_SCREEN: (context) => _addCarScreen,
      ProductsRoutes.ADD_ELECTRONIC_DEVICE_SCREEN: (context) =>
          _addElectronicDeviceScreen,
      ProductsRoutes.CAR_DETAILS_SCREEN: (context) => _carDetailsScreen,
      ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN: (context) =>
          _electronicDeviceDetailsScreen,
      ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN: (context) =>
          _realEstateDetailsScreen,
      ProductsRoutes.PRODUCT_IMAGES: (context) => _productImagesScreen,
      ProductsRoutes.SERVICE_DETAILS_SCREEN: (context) => _serviceDetailsScreen,
      ProductsRoutes.ADD_SERVICE_SCREEN: (context) => _addServiceScreen,

    };
  }
}
