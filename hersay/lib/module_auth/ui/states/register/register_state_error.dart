
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hersay/module_auth/ui/screen/register/register_screen.dart';
import 'package:hersay/module_auth/ui/states/register/register_state.dart';
import 'package:hersay/module_auth/ui/widget/email_password_register/email_password_register.dart';
import 'package:hersay/module_auth/ui/widget/phone_login/phone_login.dart';

class RegisterStateError extends RegisterState {
  String errorMsg;
  final registerTypeController =
  PageController( );
  bool loading = false;

  RegisterStateError(RegisterScreenState screen, this.errorMsg) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Column(
      children: [
        EmailPasswordRegisterForm(
//                  loading: loading,
          onRegisterRequest: (email, name, password) {
            screen.registerByEmail(
              email,
              email,
              password,
            );
          },
        ),
//        Expanded(
//            child: PageView(
//              controller: registerTypeController,
//              onPageChanged: (pos) {
////                userType = UserRole.values[pos];
//                // screen.refresh();
//              },
//              children: [
//                PhoneLoginWidget(
//                  codeSent: false,
//                  loading: loading,
//                  onLoginRequested: (phone) {
//                    loading = true;
//                    screen.registerByPhoneNumber(phone);
//                  },
//                  onRetry: () {},
//                  onConfirm: (confirmCode) {
//                    screen.confirmSMS(confirmCode);
//                  },
//                ),
//                EmailPasswordRegisterForm(
////                  loading: loading,
//                  onRegisterRequest: (email, name, password) {
//                    screen.registerByEmail(
//                      email,
//                      email,
//                      password,
//                    );
//                  },
//                ),
//              ],
//            )),
        MediaQuery.of(context).viewInsets.bottom == 0 ? Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(errorMsg),
          ),
        ) : Container(),
      ],
    );
  }
}