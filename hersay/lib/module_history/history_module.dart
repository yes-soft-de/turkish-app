

import 'package:flutter/cupertino.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_history/history_routes.dart';
import 'package:hersay/module_history/ui/screen/history/history_screen.dart';
import 'package:inject/inject.dart';

@provide
class HistoryModule extends YesModule{
  final HistoryScreen _historyScreen;

  HistoryModule(this._historyScreen,) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      HistoryRoutes.HISTORY_ROUTE: (context) => _historyScreen,
    };
  }
}