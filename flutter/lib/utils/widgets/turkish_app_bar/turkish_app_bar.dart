
import 'package:flutter/material.dart';
import 'package:turkesh/utils/project_colors/project_colors.dart';


class TurkishAppBar {
  static AppBar getTurkishAppBar(
      BuildContext context,
//      GlobalKey<ScaffoldState> drawerKey,
      String title,
      ) {

    return AppBar(
      backgroundColor:     ProjectColors.THEME_COLOR,
      elevation: 1,
      centerTitle: true,
      automaticallyImplyLeading: true,
      title:Text(
        '$title'
      ),
      leading: Icon(Icons.menu),
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
         },
             child: Icon(
                 Icons.search,
               size: 35,
             )),
        SizedBox(
             width: 10,
          ),
        //Add more icon here
      ],
    );


  }

  static AppBar getBackEnabledAppBar() {
    return AppBar(
//      title: Text(
//        'Swaptime',
//        style: TextStyle(fontWeight: FontWeight.w300),
//      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        // IconButton(
        //   icon: Icon(Icons.search),
        //   onPressed: () {
        //     // TODO Move to Search Page
        //   },
        // )
      ],
    );
  }
}
