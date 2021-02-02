
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';
import 'package:hersay/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:hersay/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

import '../../../auth_routes.dart';

class LoginStateError extends LoginState {
  String errorMsg;
  final loginTypeController =
  PageController( );
  bool loading = false;

  String email;
  String password;

  LoginStateError(
      LoginScreenState screen, this.errorMsg, this.email, this.password)
      : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      color: ProjectColors.THEME_COLOR,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

            padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                width: 250,
                child: Text(
                  errorMsg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil(
                AuthorizationRoutes.LOGIN_SCREEN,
                    (r) => false,
              );
            },
            child: Container(
              width: 175,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black45,
              ),
              child: Center(
                child: Text(
                  S.of(context).tryAgain,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );


  }
}