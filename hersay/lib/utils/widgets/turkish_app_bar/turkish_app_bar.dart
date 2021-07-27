import 'package:flutter/material.dart';
import 'package:hersay/module_search/search_routes.dart';
import 'package:hersay/module_search/ui/screen/search_screen/seach_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class TurkishAppBar {
  static AppBar getTurkishAppBar(
    BuildContext context,
    GlobalKey<ScaffoldState> drawerKey,
    String title,
    [double elevation]
  ) {
    return AppBar(
      backgroundColor: ProjectColors.THEME_COLOR,
      elevation:elevation??1,
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text(
          '$title',
          style: TextStyle(
            color: Colors.white,
          ),
      ),
      leading: IconButton(
        onPressed: () {
         drawerKey.currentState.openDrawer();
        },
        icon: Icon(
            Icons.menu,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        // GestureDetector(
        //     onTap: () {
        //       Navigator.pushNamed(drawerKey.currentContext,
        //           NotificationRoutes.ROUTE_NOTIFICATION_SCREEN);
        //     },
        //     child: Icon(Icons.notifications)),
        // SizedBox(
        //   width: 5,
        // ),
        GestureDetector(
            onTap: () {
//           Navigator.pushNamed(drawerKey.currentContext,
//                          SearchRoutes.ROUTE_Search
//           );
              Navigator.of(context).pushNamed(SearchRoutes.SEARCH_SCREEN_ROUTE);
            },
            child: Icon(
              Icons.search,
              size: 35,
              color: Colors.white,
            )),
        SizedBox(
          width: 10,
        ),
        //Add more icon here
      ],
    );
  }

  static AppBar getTurkishOrdinaryAppBar(
    BuildContext context,
//      GlobalKey<ScaffoldState> drawerKey,
    String title,
  ) {
    return AppBar(
      backgroundColor: ProjectColors.THEME_COLOR,
      elevation: 1,
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text('$title',style: TextStyle(color: Colors.white),),
    );
  }
}
