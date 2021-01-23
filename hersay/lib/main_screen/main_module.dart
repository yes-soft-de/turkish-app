

import 'package:flutter/cupertino.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:inject/inject.dart';

@provide
class MainModule extends YesModule{
  final MainScreen _mainScreen;

  MainModule(this._mainScreen,) {
  YesModule.RoutesMap.addAll(getRoutes());
}
  Map<String, WidgetBuilder> getRoutes() {
    return {
      MainRoutes.MAIN_SCREEN_ROUTE: (context) => _mainScreen, 
    };
  }
}