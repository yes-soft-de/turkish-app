import 'package:flutter/material.dart';
import 'package:turkesh/module_notification/ui/widget/notification_card/notification_card.dart';
import 'package:turkesh/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }
  Widget _screenUi(){
    return Scaffold(
      appBar: TurkishAppBar.getTurkishAppBar(context, 'Notifications'),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder:(BuildContext context, int index){
            return Container(
              child: NotificationCard(
                  userName: 'zolfekar seleten',
                  userImage:'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
                  notification: 'likes your Maclarn',
              ),

            );
          }),
    );
  }
}
