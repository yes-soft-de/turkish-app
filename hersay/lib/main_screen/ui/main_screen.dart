import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/module_chat/ui/screen/chats_list/chats_list_screen.dart';
import 'package:hersay/module_history/ui/screen/history/history_screen.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:hersay/module_notification/ui/screen/notifications/notification_screen.dart';
import 'package:hersay/module_profile/ui/screen/profile/profile_screen.dart';
import 'package:hersay/module_settings/ui/screen/settings/settings_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:inject/inject.dart';

@provide
class MainScreen extends StatefulWidget {
  final HomeScreen _homeScreen;
//  final SettingsScreen _settingsScreen ;
  final ChatsListScreen _chatsListScreen;
//  final ProfileScreen _profileScreen ;
  final HistoryScreen _historyScreen;
  final NotificationScreen _notificationScreen;

  MainScreen(
    this._homeScreen,
    this._chatsListScreen,
    this._historyScreen,
    this._notificationScreen,
//      this._profileScreen,
//      this._settingsScreen,
  );

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

//  @override
//  void dispose() {
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
//    if (_pageIndex == null) {
//      if (ModalRoute.of(context).settings.arguments is int) {
//        _pageIndex = ModalRoute.of(context).settings.arguments;
//      }
//    }

    var pages = [
      widget._homeScreen,
      widget._notificationScreen,
//      widget._profileScreen,
      widget._chatsListScreen,
      widget._historyScreen,
//      widget._settingsScreen,
    ];

    // Title is Deprecated!, Not My Optional Call
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
//        key: _scaffoldKey,

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex ?? 0,
          onTap: (newPos) {
            _pageIndex = newPos;
            setState(() {});
          },
          backgroundColor: ProjectColors.THEME_COLOR,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white54,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
              backgroundColor: ProjectColors.THEME_COLOR,
            ),
            BottomNavigationBarItem(
              // Title is Deprecated!, Not My Optional Call
              icon: Icon(Icons.notifications),
              title: Text(''),
              backgroundColor: ProjectColors.THEME_COLOR,
            ),

            BottomNavigationBarItem(
              // Title is Deprecated!, Not My Optional Call
              icon: Icon(Icons.chat_bubble_outline),
              title: Text(''),
              backgroundColor: ProjectColors.THEME_COLOR,
            ),
            BottomNavigationBarItem(
              // Title is Deprecated!, Not My Optional Call
              icon: Icon(Icons.history),
              title: Text(''),
              backgroundColor: ProjectColors.THEME_COLOR,
            ),
//            BottomNavigationBarItem(
//              backgroundColor: ProjectColors.THEME_COLOR,
//              icon: Icon(Icons.settings),
//              title: Text(''),
//            ),
          ],
        ),
        body: pages[_pageIndex ?? 0],
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }
}
