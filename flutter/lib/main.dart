import 'package:flutter/material.dart';

import 'main_screen/ui/main_screen.dart';
import 'module_auth/ui/screen/auth_screen.dart';
import 'module_chat/ui/screen/chats_list/chats_list_screen.dart';
import 'module_history/ui/screen/history/history_screen.dart';
import 'module_home/ui/sceen/home/home_screen.dart';
import 'module_notification/ui/screen/notifications/notification_screen.dart';
import 'module_products/ui/screen/add_car/add_car_sceen.dart';
import 'module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart';
import 'module_products/ui/screen/add_house/add_house_screen.dart';
import 'module_products/ui/screen/car_details/car_details_screen.dart';
import 'module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'module_products/ui/screen/house_details/house_details_screen.dart';
import 'module_profile/ui/screen/profile/profile_screen.dart';
import 'module_settings/ui/screen/settings/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}






