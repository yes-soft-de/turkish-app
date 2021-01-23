import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/module_auth/state_manager/login/login.state_manager.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';
import 'package:hersay/module_auth/ui/states/login/login_state_init.dart';
import 'package:inject/inject.dart';

@provide
class LoginScreen extends StatefulWidget {
  final LoginStateManager _stateManager;

  LoginScreen(this._stateManager);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {


  LoginState _currentState;

  StreamSubscription _stateSubscription;
  bool deepLinkChecked = false;

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentState = LoginStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (mounted) {
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

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  void moveToNext() {
    Navigator.pushNamed(
        context,
       MainRoutes.MAIN_SCREEN_ROUTE
    );
//    if (currentUserRole == UserRole.ROLE_OWNER) {
//      Navigator.of(context).pushNamedAndRemoveUntil(OrdersRoutes.OWNER_ORDERS_SCREEN, (r) => false);
//    } else if (currentUserRole == UserRole.ROLE_CAPTAIN) {
//      Navigator.of(context).pushNamedAndRemoveUntil(OrdersRoutes.CAPTAIN_ORDERS_SCREEN, (r) => false);
//    }
  }

  void loginCaptain(String phoneNumber) {
    widget._stateManager.loginCaptain(phoneNumber, this);
  }

  void loginOwner(String email, String password) {
    widget._stateManager.loginOwner(email, password, this);
  }

  void confirmCaptainSMS(String smsCode) {
    widget._stateManager.loginCaptain(smsCode, this);
  }

  void retryPhone() {
    _currentState = LoginStateInit(this);
  }
}