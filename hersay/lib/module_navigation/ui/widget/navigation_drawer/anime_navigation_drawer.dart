import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_profile/profile_routes.dart';
import 'package:hersay/module_search/search_routes.dart';
import 'package:hersay/module_settings/setting_routes.dart';
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
      width: 250,
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
//                GestureDetector(
//                  onTap: () {
//                    Navigator.of(context).pushNamed(
//                      NotificationRoutes.NOTIFICATION_ROUTE
//                    );
//                  },
//                  child: Container(
//                    color: ProjectColors.THEME_COLOR,
//                    padding: const EdgeInsets.fromLTRB(32, 8.0, 0, 8),
//                    child: Flex(
//                      direction: Axis.horizontal,
//                      children: [
//                        Icon(
//                          Icons.notifications,
//                          color: Colors.white,
//                        ),
//                        Container(
//                          width: 16,
//                        ),
//                        Text(
//                          S.of(context).notifications,
//                          style: TextStyle(
//                              fontFamily: 'Roboto', color: Colors.white),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchRoutes.SEARCH_SCREEN_ROUTE);
                  },
                  child: Container(
                    color: ProjectColors.THEME_COLOR,
                    padding: const EdgeInsets.fromLTRB(32, 15, 10, 20),
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
                          S.of(context).search,
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        SearchRoutes.ADVANCED_SEARCH_SCREEN_ROUTE
                    );
                  },
                  child: Container(
                    color: ProjectColors.SECONDARY_COLOR,
                    padding: const EdgeInsets.fromLTRB(32, 15, 10, 15),
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
                          S.of(context).advancedSearch,
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProfileRoutes.PROFILE_SCREEN);
                  },
                  child: Container(
                    color: ProjectColors.THEME_COLOR,
                      padding: const EdgeInsets.fromLTRB(32, 15, 10, 15),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.person_pin,
                          color: Colors.white,
                        ),
                        Container(
                          width: 16,
                        ),
                        Text(
                          S.of(context).profile,
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        SettingsRoutes.SETTINGS_SCREEN
                    );
                  },
                  child: Container(
                    color: ProjectColors.SECONDARY_COLOR,
                    padding: const EdgeInsets.fromLTRB(32, 15, 10, 15),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        Container(
                          width: 16,
                        ),
                        Text(
                          S.of(context).settings,
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

//                GestureDetector(
//                  onTap: () {
////                  Navigator.of(context).pushNamed(
////                    NotificationRoutes.ROUTE_NOTIFICATION_SCREEN,
////                    arguments: 1,
////                  );
//                  },
//                  child: Container(
//                    color: ProjectColors.THEME_COLOR,
//                      padding: const EdgeInsets.fromLTRB(32, 15, 0, 15),
//                    child: Flex(
//                      direction: Axis.horizontal,
//                      children: [
//                        Icon(
//                          Icons.block,
//                          color: Colors.white,
//                        ),
//                        Container(
//                          width: 16,
//                        ),
//                        Text('Blocks',
//                            style: TextStyle(
//                                fontFamily: 'Roboto', color: Colors.white)),
//                      ],
//                    ),
//                  ),
//                ),
                GestureDetector(
                  onTap: () {
//                  Navigator.of(context).pushNamed(
//                      SettingRoutes.SETTING_SCREEN_ROUTE,
//                      arguments: 1);
                  },
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(32, 15, 10, 15),
                    color: ProjectColors.THEME_COLOR,
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
                        Text(
                            S.of(context).about,
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
