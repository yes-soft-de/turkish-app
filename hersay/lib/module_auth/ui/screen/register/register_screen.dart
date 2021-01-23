
import 'package:flutter/material.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/module_auth/state_manager/register/register.state_manager.dart';
import 'package:hersay/module_auth/ui/states/register/register_state.dart';
import 'package:hersay/module_auth/ui/states/register/register_state_init.dart';
import 'package:inject/inject.dart';

@provide
class RegisterScreen extends StatefulWidget {
  final RegisterStateManager _stateManager;

  RegisterScreen(this._stateManager);

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  RegisterState _currentState;

  @override
  void initState() {
    super.initState();

    _currentState = RegisterStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      if (this.mounted) {
        setState(() {
          _currentState = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentState.getUI(context),
    );
  }


  void registerByPhoneNumber(String phoneNumber) {
    widget._stateManager.registerByPhoneNumber(phoneNumber, this);
  }

  void registerByEmail(String email, String username, String password) {
    widget._stateManager.registerByEmail(email, username, password, this);
  }

  void confirmSMS(String smsCode) {
    widget._stateManager.registerByPhoneNumber(smsCode, this);
  }

  void retryPhone() {
    _currentState = RegisterStateInit(this);
  }

  void moveToNext() {
    Navigator.pushNamed(
        context,
        MainRoutes.MAIN_SCREEN_ROUTE
    );
//    if (currentUserRole == UserRole.ROLE_OWNER) {
//      Navigator.of(context).pushNamedAndRemoveUntil(InitAccountRoutes.INIT_ACCOUNT_SCREEN, (r) => false);
//    } else if (currentUserRole == UserRole.ROLE_CAPTAIN) {
//      Navigator.of(context).pushNamedAndRemoveUntil(OrdersRoutes.CAPTAIN_ORDERS_SCREEN, (r) => false);
//    }
  }
}