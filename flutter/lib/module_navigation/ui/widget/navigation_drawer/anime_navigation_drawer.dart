import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hersay/module_notification/ui/screen/notifications/notification_screen.dart';
import 'package:hersay/module_search/ui/screen/search_screen/seach_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class TurkishNavigationDrawer extends StatelessWidget {
//  final ProfileSharedPreferencesHelper _profileSharedPreferencesHelper;
//
//  AnimeNavigationDrawer(
//    this._profileSharedPreferencesHelper,
//  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      child: Drawer(
          child: Container(
        color: ProjectColors.THEME_COLOR,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              height: 175,
              color: ProjectColors.SECONDARY_COLOR,
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2.0,
                          // has the effect of softening the shadow
                          spreadRadius: 2.0,
                          // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
                  },
                  child: Container(
                    color: ProjectColors.THEME_COLOR,
                    padding: const EdgeInsets.fromLTRB(32, 8.0, 0, 8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        Container(
                          width: 16,
                        ),
                        Text(
                          'Notification',
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen()));
                  },
                  child: Container(
                    color: ProjectColors.SECONDARY_COLOR,
                    padding: const EdgeInsets.fromLTRB(32, 8.0, 0, 8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Container(
                          width: 16,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
//                  Navigator.of(context).pushNamed(
//                    NotificationRoutes.ROUTE_NOTIFICATION_SCREEN,
//                    arguments: 1,
//                  );
                  },
                  child: Container(
                    color: ProjectColors.THEME_COLOR,
                    padding: const EdgeInsets.fromLTRB(32, 8.0, 0, 8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.block,
                          color: Colors.white,
                        ),
                        Container(
                          width: 16,
                        ),
                        Text('Blocks',
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
//                  Navigator.of(context).pushNamed(
//                      SettingRoutes.SETTING_SCREEN_ROUTE,
//                      arguments: 1);
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(32, 8.0, 0, 8),
                    color: ProjectColors.SECONDARY_COLOR,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        Container(
                          width: 16,
                        ),
                        Text('About',
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}