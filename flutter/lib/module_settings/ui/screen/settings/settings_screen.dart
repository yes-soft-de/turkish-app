import 'package:flutter/material.dart';
import 'package:turkesh/module_settings/ui/screen/general_settings/general_settings_screen.dart';
import 'package:turkesh/module_settings/ui/screen/notification_settings/notification_settings_screen.dart';
import 'package:turkesh/module_settings/ui/screen/privacy_settings/privacy_settings_screen.dart';
import 'package:turkesh/utils/project_colors/project_colors.dart';
import 'package:turkesh/utils/widgets/icon_text/icon_text_widget.dart';
import 'package:turkesh/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi() {
    return Scaffold(
      appBar: TurkishAppBar.getTurkishAppBar(context, 'Settings'),
      body: Column(
        children: [
          Container(
            height: 150,
            color: ProjectColors.SECONDARY_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Text(
                    'Zolfekar Seleten',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          //general setting
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GeneralSettingsScreen()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: IconTextWidget(
                icon: Icons.settings,
                text: 'General',
              ),
            ),
          ),
          // privacy setting
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacySettingsScreen()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: IconTextWidget(
                icon: Icons.security,
                text: 'Privacy',
              ),
            ),
          ),
          //notification setting
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationSettingsScreen()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: IconTextWidget(
                icon: Icons.notifications,
                text: 'Notification',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: IconTextWidget(
              icon: Icons.help,
              text: 'Help',
            ),
          ),
        ],
      ),
    );
  }
}
