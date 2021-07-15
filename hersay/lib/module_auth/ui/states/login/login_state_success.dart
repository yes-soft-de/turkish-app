
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';

class LoginStateSuccess extends LoginState {
  LoginStateSuccess(LoginScreenState screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      screen.moveToNext();
    });
    return Column(
      children: [
        Text('Login Success'),
      ],
    );
  }
}