
import 'package:flutter/cupertino.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';
import 'package:hersay/module_auth/ui/screen/register/register_screen.dart';
import 'package:inject/inject.dart';


@provide
class AuthorizationModule extends YesModule {
  final LoginScreen _loginScreen;
  final RegisterScreen _registerScreen;

  AuthorizationModule(this._loginScreen, this._registerScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthorizationRoutes.LOGIN_SCREEN: (context) => _loginScreen,
      AuthorizationRoutes.REGISTER_SCREEN: (context) => _registerScreen,
    };
  }
}