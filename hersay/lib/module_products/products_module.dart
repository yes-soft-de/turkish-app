import 'package:flutter/material.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart';
import 'package:hersay/module_products/ui/screen/add_real_estate/add_real_estate_screen.dart';
import 'package:inject/inject.dart';

@provide
@singleton
class ProductsModule extends YesModule {
  final AddRealEstateScreen _addRealEstateScreen;
  final AddCarScreen _addCarScreen;
  final AddElectronicDeviceScreen _addElectronicDeviceScreen;

  ProductsModule(
      this._addRealEstateScreen,
      this._addCarScreen,
      this._addElectronicDeviceScreen,
      ) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProductsRoutes.ADD_REAL_ESTATE_SCREEN: (context) => _addRealEstateScreen,
      ProductsRoutes.ADD_CAR_SCREEN: (context) => _addCarScreen,
      ProductsRoutes.ADD_ELECTRONIC_DEVICE_SCREEN: (context) => _addElectronicDeviceScreen,
    };
  }
}

