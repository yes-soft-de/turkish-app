  import 'package:flutter/material.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_profile/profile_routes.dart';
import 'package:hersay/module_profile/ui/screen/edit_profile/edit_profile_screen.dart';
import 'package:hersay/module_profile/ui/screen/profile/profile_screen.dart';
import 'package:hersay/module_report/report_routes.dart';
import 'package:hersay/module_report/ui/screen/report/report_screen.dart';
import 'package:inject/inject.dart';

@provide
class ReportModule extends YesModule{
  final ReportScreen _reportScreen;
  ReportModule(
      this._reportScreen,
      ){
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      ReportRoutes.REPORT_SCREEN: (context) => _reportScreen,
    };
  }
}