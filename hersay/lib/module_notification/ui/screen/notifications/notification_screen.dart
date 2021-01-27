import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_notification/state_manager/notification/notification.state_manger.dart';
import 'package:hersay/module_notification/ui/state/notification/notification.state.dart';
import 'package:hersay/module_notification/ui/widget/notification_card/notification_card.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class NotificationScreen extends StatefulWidget {
  final NotificationStateManager _stateManager;

  NotificationScreen(
      this._stateManager,
      );

  @override
   NotificationScreenState createState() =>  NotificationScreenState();
}

class  NotificationScreenState extends State<NotificationScreen> {
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(
          context, _scaffoldKey,S.of(context).notifications),
      drawer: TurkishNavigationDrawer(),
      body:currentState.getUI(context),
    );
  }

  void getNotifications() {
    widget._stateManager.getNotifications(this);
  }

  Widget _screenUi() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(
          context, _scaffoldKey,S.of(context).notifications),
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
    );
  }
}
