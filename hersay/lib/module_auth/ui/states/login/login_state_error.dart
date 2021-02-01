
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';
import 'package:hersay/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:hersay/module_auth/ui/widget/phone_login/phone_login.dart';

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
    return Column(
      children: [
        EmailPasswordLoginForm(
          loading: loading,
          onLoginRequest: (email, password) {
            loading = true;
            screen.refresh();
            screen.login(
              email,
              password,
            );
          },
        ),
//        Expanded(
//            child: PageView(
//              controller: loginTypeController,
//              onPageChanged: (pos) {
//
//              },
//              children: [
//                PhoneLoginWidget(
//                  codeSent: false,
//                  loading: loading,
//                  onLoginRequested: (phone) {
//                    loading = true;
//                    screen.loginCaptain(phone);
//                  },
//                  onRetry: () {},
//                  onConfirm: (confirmCode) {
//                    screen.confirmCaptainSMS(confirmCode);
//                  },
//                ),
//                EmailPasswordLoginForm(
//                  loading: loading,
//                  onLoginRequest: (email, password) {
//                    loading = true;
//                    screen.refresh();
//                    screen.loginOwner(
//                      email,
//                      password,
//                    );
//                  },
//                ),
//              ],
//            )),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(errorMsg),
          ),
        )
      ],
    );
  }
}