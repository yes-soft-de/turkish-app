
import 'package:hersay/module_notification/service/notification/notification.service.dart';
import 'package:hersay/module_notification/ui/screen/notifications/notification_screen.dart';
import 'package:hersay/module_notification/ui/state/notification/notification.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class NotificationStateManager{
  final NotificationService _service;
  PublishSubject<NotificationState> _stateSubject = new PublishSubject();
  Stream<NotificationState> get stateStream  => _stateSubject.stream;
  
  NotificationStateManager(
      this._service,
      );

  void getNotifications(NotificationScreenState screenState) {
    _stateSubject.add(NotificationStateLoading(screenState));
    _service.getNotification().then((value) {
      if (value == null) {
        _stateSubject
            .add(NotificationStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(NotificationStateDataLoaded(value, screenState));
      }
    });
  }
  
}