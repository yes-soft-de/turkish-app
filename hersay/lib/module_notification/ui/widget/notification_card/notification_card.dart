import 'package:flutter/material.dart';
import 'package:hersay/module_chat/chat_routes.dart';
import 'package:hersay/module_products/products_routes.dart';

class NotificationCard extends StatelessWidget {
  final String userName;
  final String notification;
  final String userImage;
  final String time;
  final String roomID;
  final int itemID;
  final String entity;
  NotificationCard(
      {this.userName,
      this.notification,
      this.userImage,
      this.time,
      this.roomID,
      this.entity,
      this.itemID});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (roomID != null) {
          Navigator.of(context)
              .pushNamed(ChatRoutes.chatRoute, arguments: roomID);
        } else if (itemID != null) {
          if (entity == 'service') {
            Navigator.of(context).pushNamed(
                ProductsRoutes.SERVICE_DETAILS_SCREEN,
                arguments: itemID);
          } else if (entity == 'car') {
            Navigator.of(context).pushNamed(ProductsRoutes.CAR_DETAILS_SCREEN,
                arguments: itemID);
          } else if (entity == 'realEstate') {
            Navigator.of(context).pushNamed(
                ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
                arguments: itemID);
          } else {
            Navigator.of(context).pushNamed(
                ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN,
                arguments: itemID);
          }
        } else {

        }
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
          child: Column(
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
                            child: ClipOval(
                              child: Image.network(
                                userImage,
                                fit: BoxFit.cover,
                                errorBuilder: (_, d, c) {
                                  return Image.asset(
                                      'assets/images/profilePic.jpg');
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              children: [
                                Text(
                                  '$userName $notification',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )),
                        Text(
                          '$time',
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
                width: MediaQuery.of(context).size.width,
              )
            ],
          )),
    );
  }
}
