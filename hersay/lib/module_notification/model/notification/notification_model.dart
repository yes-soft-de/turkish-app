
import 'package:hersay/module_notification/response/notification/notification_response.dart';
import 'package:intl/intl.dart';

class NotificationModel {
  String userName;
  String entityName;
  String date;

  NotificationModel({
    this.userName,
    this.date,
    this.entityName,
  });

  static List<NotificationModel> getNotificationModelList(NotificationResponse response){
    List<NotificationModel> notifications = [];
    var df = DateFormat('dd-MM-yyyy hh:mm');
    response.data.forEach((element) {
      var date = new DateTime.fromMillisecondsSinceEpoch(element.createdAt.timestamp * 1000);

      notifications.add(
        new NotificationModel(
          date: df.format(date),
          userName: element.username,
          entityName: element.entityName,
        )
      );
    });

    return notifications;
  }
}
