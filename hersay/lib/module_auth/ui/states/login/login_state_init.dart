
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';
import 'package:hersay/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:hersay/module_auth/ui/widget/phone_login/phone_login.dart';

class LoginStateInit extends LoginState {
  final loginTypeController =
  PageController( );
  bool loading = false;

  LoginStateInit(LoginScreenState screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return EmailPasswordLoginForm(
      loading: loading,
      onLoginRequest: (email, password) {
        screen.login(
          email,
          password,
        );
      },
    );
  }
}