import 'package:flutter/cupertino.dart';
import 'package:hersay/about_screen/about_screen.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:inject/inject.dart';

@provide
class MainModule extends YesModule {
  final MainScreen _mainScreen;
  final AboutScreen _aboutScreen;
  MainModule(
    this._mainScreen,
    this._aboutScreen
  ) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      MainRoutes.MAIN_SCREEN_ROUTE: (context) => _mainScreen,
      MainRoutes.ABOUT_SCREEN_ROUTE:(context) => _aboutScreen,
    };
  }
}
