
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/ui/screen/register/register_screen.dart';
import 'package:hersay/module_auth/ui/states/register/register_state.dart';
import 'package:hersay/module_auth/ui/widget/email_password_register/email_password_register.dart';
import 'package:hersay/module_auth/ui/widget/phone_login/phone_login.dart';

class RegisterStateInit extends RegisterState {
//  final registerTypeController =
//  PageController(initialPage: 1 );
//  bool loading = false;

  RegisterStateInit(RegisterScreenState screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Column(
      children: [
        EmailPasswordRegisterForm(
//                  loading: loading,
          onRegisterRequest: (email, password, name) {
            screen.registerByEmail(
              email,
              name,
              password,
            );
          },
        ),
//        Expanded(
//            child: PageView(
//              controller: registerTypeController,
//              onPageChanged: (pos) {
//                userType = UserRole.values[pos];
//              },
//              children: [
//                PhoneLoginWidget(
//                  codeSent: false,
//                  loading: loading,
//                  onLoginRequested: (phone) {
//                    loading = true;
//                    screen.registerByPhoneNumber(phone);
//                  },
//                  onConfirm: (confirmCode) {
//                    screen.confirmSMS(confirmCode);
//                  },
//                ),
//                EmailPasswordRegisterForm(
////                  loading: loading,
//                  onRegisterRequest: (email, password, name) {
//                    screen.registerByEmail(
//                      email,
//                      email,
//                      password,
//                    );
//                  },
//                ),
//              ],
//            )),
      ],
    );
  }
}