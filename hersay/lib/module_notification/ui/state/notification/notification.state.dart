import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_notification/model/notification/notification_model.dart';
import 'package:hersay/module_notification/ui/screen/notifications/notification_screen.dart';
import 'package:hersay/module_notification/ui/widget/notification_card/notification_card.dart';

abstract class NotificationState {
  final NotificationScreenState screenState;

  NotificationState(this.screenState);

  Widget getUI(BuildContext context);
}

class NotificationStateInit extends NotificationState {
  NotificationStateInit(NotificationScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to Notification Screen'),
    );
  }
}

class NotificationStateLoading extends NotificationState {
  NotificationStateLoading(NotificationScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class NotificationStateUnauthorized extends NotificationState {
  NotificationStateUnauthorized(NotificationScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class NotificationStateDataLoaded extends NotificationState {
  List<NotificationModel> notifications = [];

  NotificationStateDataLoaded(
      this.notifications, NotificationScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        screenState.getNotifications();
        return Future.delayed(Duration(seconds: 3));
      },
      child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            if (notifications[index].type == 'chat') {
              return Container(
                child: NotificationCard(
                  userName: notifications[index].userName,
                  notification: S.of(context).openChatWithYou,
                  time: notifications[index].date,
                  roomID: notifications[index].roomID,
                  userImage:notifications[index].userImage??'' ,
                ),
              );
            } else if (notifications[index].type == 'comment') {
              return Container(
                child: NotificationCard(
                  userName: notifications[index].userName,
                  notification: S.of(context).commentOn +
                      ' ${notifications[index].entityName}',
                  time: notifications[index].date,
                  userImage: notifications[index].userImage??'',
                  entity:notifications[index].entity ,
                  itemID:notifications[index].itemID ,
                ),
              );
            } else {
              return Container(
                child: NotificationCard(
                  userName: notifications[index].userName,
                  notification: S.of(context).likesYour +
                      ' ${notifications[index].entityName}',
                  time: notifications[index].date,
                  userImage: notifications[index].userImage??'',
                ),
              );
            }
          }),
    );
  }
}

class NotificationStateError extends NotificationState {
  final String errorMsg;

  NotificationStateError(this.errorMsg, NotificationScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}
