
import 'package:flutter/material.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
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
      body:   Container(
        color: ProjectColors.THEME_COLOR,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius:
                    2.0, // has the effect of softening the shadow
                    spreadRadius:
                    2.0, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ]),
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),

    );
  }
}