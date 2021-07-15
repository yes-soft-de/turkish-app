
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/ui/screen/register/register_screen.dart';
import 'package:hersay/module_auth/ui/states/register/register_state.dart';
import 'package:hersay/module_auth/ui/widget/email_password_register/email_password_register.dart';
import 'package:hersay/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

import '../../../auth_routes.dart';

class RegisterStateError extends RegisterState {
  String errorMsg;
  final registerTypeController =
  PageController( );
  bool loading = false;

  RegisterStateError(RegisterScreenState screen, this.errorMsg) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                  AuthorizationRoutes.REGISTER_SCREEN,
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
      ),
    );


  }
}