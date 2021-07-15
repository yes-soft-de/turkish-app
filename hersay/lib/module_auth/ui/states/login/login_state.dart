
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';

abstract class LoginState {
  final LoginScreenState screen;
  LoginState(this.screen);

  Widget getUI(BuildContext context);
}