
import 'package:flutter/material.dart';


class NotificationCard extends StatelessWidget {
  final String userImage;
  final String userName;
  final String notification;

  NotificationCard({
    this.userImage,
    this.userName,
    this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return   Container(
        width: MediaQuery.of(context).size.width  ,
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(

                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 45,
                          width: 45,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(userImage),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child:Column(
                          children: [

                            Text(
                              '$userName $notification' ,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),

                          ],
                        )
                      ),


                    ],
                  ),
                ),

              ],
            ),
            Container(
              height: 1,
              color: Colors.grey,
              width: MediaQuery.of(context).size.width  ,
            )
          ],
        )


    )  ;
  }
}
