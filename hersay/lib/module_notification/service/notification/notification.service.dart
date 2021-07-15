
import 'package:hersay/module_notification/manager/notification/notification.manager.dart';
import 'package:hersay/module_notification/model/notification/notification_model.dart';
import 'package:hersay/module_notification/response/notification/notification_response.dart';
import 'package:inject/inject.dart';

@provide
class NotificationService{
  final NotificationManager _notificationManager;

  NotificationService(
      this._notificationManager,
      );

  Future<List<NotificationModel>> getNotification()async{
    NotificationResponse response = await _notificationManager.getNotification();
    if(response == null) return null;

   return NotificationModel.getNotificationModelList(response);
  }
}