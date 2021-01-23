

import 'package:flutter/cupertino.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_home/home_routes.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:inject/inject.dart';

@provide
class HomeModule extends YesModule{
  final HomeScreen _homeScreen;

  HomeModule(this._homeScreen,) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomeRoutes.Home_SCREEN_ROUTE: (context) => _homeScreen,
    };
  }
}