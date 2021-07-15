import 'package:hersay/module_notification/response/notification/notification_response.dart';
import 'package:intl/intl.dart';

class NotificationModel {
  String userName;
  String userImage;
  String entityName;
  String date;
  String type;
  String roomID;
  int itemID;
  String entity;
  NotificationModel(
      {this.userName,
      this.date,
      this.entityName,
      this.userImage,
      this.type,
      this.roomID,
      this.itemID,
      this.entity});

  static List<NotificationModel> getNotificationModelList(
      NotificationResponse response) {
    List<NotificationModel> notificationsReactions = [];
    List<NotificationModel> notificationsComments = [];
    List<NotificationModel> notificationsChats = [];
    List<NotificationModel> notifications = [];

    var df = DateFormat('dd-MM-yyyy');
    response.data.chats?.forEach((element) {
      var date = new DateTime.fromMillisecondsSinceEpoch(
          element.startAt.timestamp * 1000);
      notificationsChats.add(NotificationModel(
          date: df.format(date),
          userName: element.username,
          userImage: element.image,
          type: 'chat',
          roomID: element.roomID));
    });
    response.data.comments?.forEach((element) {
      var date = new DateTime.fromMillisecondsSinceEpoch(
          element.createdAt.timestamp * 1000);
      notificationsComments.add(NotificationModel(
        date: df.format(date),
        userName: element.userName,
        userImage: element.image,
        type: 'comment',
        entityName: element.entityName ?? element.entity ?? '',
        entity: element.entity,
        itemID: element.itemID,
      ));
    });
    response.data.reactions?.forEach((element) {
      var date = new DateTime.fromMillisecondsSinceEpoch(
          element.createdAt.timestamp * 1000);
      notificationsReactions.add(NotificationModel(
        date: df.format(date),
        userName: element.username,
        userImage: element.image ?? element.userImage ?? '',
        type: 'reaction',
        entityName: element.entityName ?? '',
      ));
    });
    notifications.addAll(notificationsReactions);
    notifications.addAll(notificationsComments);
    notifications.addAll(notificationsChats);

    return notifications;
  }
}
