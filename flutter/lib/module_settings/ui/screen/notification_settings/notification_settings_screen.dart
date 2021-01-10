import 'package:flutter/material.dart';
import 'package:hersay/module_notification/ui/widget/setting_switch_widget/setting_switch_widget.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool isSwitched = true;

  List<String> _notificationSounds = ['candy', 'mandy', 'terisa'];
  String _selectedNotificationSound;

  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi() {
    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, 'Notification'),
      body: Column(
        children: [
          SettingSwitchWidget(
            text: 'Mute Notification',
          ),
          SettingSwitchWidget(
            text: 'Vibrate For Notification',
          ),
          SettingSwitchWidget(
            text: 'Vibrate for Messages',
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: _selectedNotificationSound == null
                        ? Text(
                            'Notification Sound',
                            style: TextStyle(color: Colors.grey),
                          )
                        : Text(
                            '$_selectedNotificationSound',
                            style: TextStyle(color: Colors.grey),
                          ),
                    items: _notificationSounds.map((String place) {
                      return new DropdownMenuItem<String>(
                        value: place.toString(),
                        child: new Text(place),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedNotificationSound =
                            _notificationSounds.firstWhere(
                                (element) => element.toString() == value);
                      });
                    }),
              )),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          color: ProjectColors.THEME_COLOR,
          height: 65,
          child: Center(
            child: Text(
              'Save Changes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
