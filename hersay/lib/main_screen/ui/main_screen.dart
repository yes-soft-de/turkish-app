import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/module_chat/ui/screen/chats_list/chats_list_screen.dart';
import 'package:hersay/module_history/ui/screen/history/history_screen.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:hersay/module_profile/ui/screen/profile/profile_screen.dart';
import 'package:hersay/module_settings/ui/screen/settings/settings_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:inject/inject.dart';

@provide
class MainScreen extends StatefulWidget {
  final HomeScreen _homeScreen;
  final SettingsScreen _settingsScreen ;
  final ChatsListScreen _chatsListScreen ;
  final ProfileScreen _profileScreen ;
  final HistoryScreen _historyScreen ;

  MainScreen(
      this._homeScreen,
      this._chatsListScreen,
      this._historyScreen,
      this._profileScreen,
      this._settingsScreen,
      );

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _pageIndex;

//  @override
//  void initState() {
//    super.initState();
//    widget._authService.isLoggedIn.then((value) {
//      if (value != true) {
//        Navigator.of(context).pushNamedAndRemoveUntil(
//          AuthRoutes.ROUTE_AUTHORIZE,
//              (route) => false,
//        );
//      }
//    });
//  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pageIndex == null) {
      if (ModalRoute.of(context).settings.arguments is int) {
        _pageIndex = ModalRoute.of(context).settings.arguments;
      }
    }

    var pages = [
      widget._homeScreen,
      widget._historyScreen,
      widget._profileScreen,
      widget._chatsListScreen,
      widget._settingsScreen,
    ];

    // Title is Deprecated!, Not My Optional Call
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
//        key: _scaffoldKey,
//        drawer: widget._animeNavigationDrawer,
//
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
              icon: Icon(Icons.history),
              title: Text(''),
              backgroundColor: ProjectColors.THEME_COLOR,
            ),
//          BottomNavigationBarItem(
//            // Title is Deprecated!, Not My Optional Call
//            icon: Icon(Icons.search),
//            title: Text(''),
//            backgroundColor: ProjectColors.ThemeColor,
//          ),
            BottomNavigationBarItem(
              // Title is Deprecated!, Not My Optional Call
              icon: Icon(Icons.person_pin),
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
              backgroundColor: ProjectColors.THEME_COLOR,
              icon: Icon(Icons.settings),
              title: Text(''),
            ),
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
