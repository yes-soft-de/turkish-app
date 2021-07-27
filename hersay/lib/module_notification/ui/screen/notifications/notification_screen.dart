import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_home/home_routes.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_notification/notification_routes.dart';
import 'package:hersay/module_notification/state_manager/notification/notification.state_manger.dart';
import 'package:hersay/module_notification/ui/state/notification/notification.state.dart';
import 'package:hersay/module_notification/ui/widget/notification_card/notification_card.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class NotificationScreen extends StatefulWidget {
  final NotificationStateManager _stateManager;
  final AuthService _authService;
  NotificationScreen(
    this._stateManager,
    this._authService,
  );

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  NotificationState currentState;

  @override
  void initState() {
    super.initState();
    currentState = NotificationStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });

    widget._stateManager.getNotifications(this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: NotificationRoutes.NOTIFICATION_ROUTE,
            additionalData: null);
        Navigator.of(context)
            .pushNamed(AuthorizationRoutes.LOGIN_SCREEN, arguments: redirectTo);
      }
    });
    return WillPopScope(
      onWillPop: () async {
        var additionalData = ModalRoute.of(context).settings.arguments;
        if (additionalData != null && additionalData is bool) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MainRoutes.MAIN_SCREEN_ROUTE, (route) => false);
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: TurkishAppBar.getTurkishAppBar(
            context, _scaffoldKey, S.of(context).notifications),
        drawer: TurkishNavigationDrawer(),
        body: currentState.getUI(context),
      ),
    );
  }

  void getNotifications() {
    widget._stateManager.getNotifications(this);
  }

  Widget _screenUi() {
    return WillPopScope(
      onWillPop: () async {
        var additionalData = ModalRoute.of(context).settings.arguments;
        if (additionalData != null && additionalData is bool) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MainRoutes.MAIN_SCREEN_ROUTE, (route) => false);
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: TurkishAppBar.getTurkishAppBar(
            context, _scaffoldKey, S.of(context).notifications),
        drawer: TurkishNavigationDrawer(),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: NotificationCard(
                  userName: 'zolfekar seleten',
                  notification: 'likes your Maclarn',
                ),
              );
            }),
      ),
    );
  }
}
