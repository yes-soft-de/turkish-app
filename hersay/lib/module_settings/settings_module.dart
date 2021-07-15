  import 'package:flutter/material.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_settings/setting_routes.dart';
import 'package:hersay/module_settings/ui/screen/settings/settings_screen.dart';
import 'package:inject/inject.dart';

@provide
class SettingModule extends YesModule{
  final SettingsScreen _settingsScreen;

  SettingModule(this._settingsScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      SettingsRoutes.SETTINGS_SCREEN: (context) => _settingsScreen,
    };
  }
}