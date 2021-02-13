
import 'package:hersay/module_notification/response/notification/notification_response.dart';
import 'package:intl/intl.dart';

class NotificationModel {
  String userName;
  String userImage;
  String entityName;
  String date;

  NotificationModel({
    this.userName,
    this.date,
    this.entityName,
    this.userImage,
  });

  static List<NotificationModel> getNotificationModelList(NotificationResponse response){
    List<NotificationModel> notifications = [];
    var df = DateFormat('dd-MM-yyyy');
    response.data.forEach((element) {
      var date = new DateTime.fromMillisecondsSinceEpoch(element.createdAt.timestamp * 1000);

      notifications.add(
        new NotificationModel(
          date: df.format(date),
          userName: element.username,
          entityName: element.entityName,
          userImage: element.userImage,
        )
      );
    });

    return notifications;
  }
}
