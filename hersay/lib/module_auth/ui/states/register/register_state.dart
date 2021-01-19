
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/ui/screen/register/register_screen.dart';

abstract class RegisterState {
  final RegisterScreenState screen;
  RegisterState(this.screen);

  Widget getUI(BuildContext context);
}