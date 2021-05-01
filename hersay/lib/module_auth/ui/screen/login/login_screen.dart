import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/module_auth/state_manager/login/login.state_manager.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';
import 'package:hersay/module_auth/ui/states/login/login_state_init.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
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
  String redirectTo = MainRoutes.MAIN_SCREEN_ROUTE;
  int itemId;

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
    RouteHelper route = ModalRoute.of(context).settings.arguments;
    if (route != null) {
      redirectTo = route.redirectTo;
      if (route.additionalData != null) itemId = route.additionalData;
    }

    return Scaffold(
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: _currentState.getUI(context)),
    );
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  void moveToNext() {
    (itemId == null)
        ? Navigator.pushNamed(context, redirectTo)
        : Navigator.pushNamed(context, redirectTo, arguments: itemId);
  }

  void login(String email, String password) {
    widget._stateManager.login(email, password, this);
  }

  void confirmCaptainSMS(String smsCode) {
    widget._stateManager.loginCaptain(smsCode, this);
  }

  void retryPhone() {
    _currentState = LoginStateInit(this);
  }
}
