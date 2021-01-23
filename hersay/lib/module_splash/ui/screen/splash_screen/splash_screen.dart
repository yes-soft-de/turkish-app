
import 'package:flutter/material.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:inject/inject.dart';

@provide
class SplashScreen extends StatefulWidget {
  final AuthService _authService;

  SplashScreen(this._authService);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._authService.isLoggedIn.then((value) {
        if (value  ) {

          Navigator.of(context).pushNamedAndRemoveUntil(
              MainRoutes.MAIN_SCREEN_ROUTE, (route) => false);

        }  else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AuthorizationRoutes.REGISTER_SCREEN, (route) => false);
        }
      }).catchError((err) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AuthorizationRoutes.REGISTER_SCREEN, (route) => false);
      });
    });
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}