
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';


class ChatItemCard extends StatelessWidget {
  final String userImage;
  final String userName;
  final String time;

  ChatItemCard({
    this.userImage,
    this.userName,
    this.time,
  });
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 80,
      width: MediaQuery.of(context).size.width  ,
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(userImage),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width*0.4,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           userName??'',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Container(
                           height: 1,
                           color: Colors.grey,
                             width: MediaQuery.of(context).size.width*0.4,
                         )
                       ],
                     ),
                   ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                           S.of(context).startedAt,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            time??'',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                            width: MediaQuery.of(context).size.width*0.3,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      )


    )  ;
  }
}
