
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/ui/screen/register/register_screen.dart';
import 'package:hersay/module_auth/ui/states/register/register_state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class RegisterStateLoading extends RegisterState {
  String errorMsg;
  final loginTypeController =
  PageController( );
  bool loading = false;

  String email;
  String password;

  RegisterStateLoading(
      RegisterScreenState screen)
      : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: ProjectColors.THEME_COLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              S.of(context).loading,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
    );
  }
}