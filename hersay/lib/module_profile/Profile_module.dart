  import 'package:flutter/material.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_profile/profile_routes.dart';
import 'package:hersay/module_profile/ui/screen/profile/profile_screen.dart';
import 'package:inject/inject.dart';

@provide
class ProfileModule extends YesModule{
  final ProfileScreen _profileScreen;

  ProfileModule(this._profileScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.PROFILE_SCREEN: (context) => _profileScreen,
    };
  }
}