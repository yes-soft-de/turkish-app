import 'package:flutter/material.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/ui/screen/add_real_estate/add_real_estate_screen.dart';
import 'package:inject/inject.dart';

@provide
@singleton
class ProductsModule extends YesModule {
  final AddRealEstateScreen _addRealEstateScreen;

  ProductsModule(
      this._addRealEstateScreen,

      ) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProductsRoutes.ADD_REAL_ESTATE_SCREEN: (context) => _addRealEstateScreen,
    };
  }
}

