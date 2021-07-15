

import 'package:flutter/cupertino.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_notification/notification_routes.dart';
import 'package:hersay/module_notification/ui/screen/notifications/notification_screen.dart';
import 'package:inject/inject.dart';

@provide
class NotificationModule extends YesModule{
  final NotificationScreen _notificationScreen;

  NotificationModule(this._notificationScreen,) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      NotificationRoutes.NOTIFICATION_ROUTE: (context) => _notificationScreen,
    };
  }
}