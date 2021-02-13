
import 'package:flutter/material.dart';


class NotificationCard extends StatelessWidget {
  final String userName;
  final String notification;
  final String userImage;
  final String time;

  NotificationCard({
    this.userName,
    this.notification,
    this.userImage,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return   Container(
        width: MediaQuery.of(context).size.width  ,
        padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            backgroundImage: NetworkImage('$userImage'),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child:Column(
                          children: [

                            Text(
                              '$userName $notification' ,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),

                          ],
                        )
                      ),
                      Text(
                        'at $time' ,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      Icon(Icons.notifications_active),


                    ],
                  ),
                ),

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 1,
              color: Colors.grey,
              width: MediaQuery.of(context).size.width  ,
            )
          ],
        )


    )  ;
  }
}
