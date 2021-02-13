
import 'package:hersay/module_notification/repository/notification/notification.reppsitory.dart';
import 'package:hersay/module_notification/response/notification/notification_response.dart';
import 'package:inject/inject.dart';

@provide
class NotificationManager{
  final NotificationRepository _repository;

  NotificationManager(
      this._repository,
      );

  Future<NotificationResponse> getNotification()async => _repository.getNotification();
}