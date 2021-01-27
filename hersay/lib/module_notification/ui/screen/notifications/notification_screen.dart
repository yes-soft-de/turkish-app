import 'package:flutter/material.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_notification/ui/widget/notification_card/notification_card.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class NotificationScreen extends StatefulWidget {

  @override
   NotificationScreenState createState() =>  NotificationScreenState();
}

class  NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  void getNotifications(){

  }

  Widget _screenUi() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(
          context, _scaffoldKey, 'Notifications'),
      drawer: TurkishNavigationDrawer(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: NotificationCard(
                userName: 'zolfekar seleten',
                userImage:
                    'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
                notification: 'likes your Maclarn',
              ),
            );
          }),
    );
  }
}
