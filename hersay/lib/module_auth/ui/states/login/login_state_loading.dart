
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';
import 'package:hersay/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:hersay/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

import '../../../auth_routes.dart';

class LoginStateLoading extends LoginState {
  String errorMsg;
  final loginTypeController =
  PageController( );
  bool loading = false;

  String email;
  String password;

  LoginStateLoading(
      LoginScreenState screen)
      : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: ProjectColors.THEME_COLOR,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}