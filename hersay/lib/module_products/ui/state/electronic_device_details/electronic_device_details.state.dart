import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/module_products/ui/widgets/commentCard.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:intl/intl.dart';

import '../../../products_routes.dart';

abstract class ElectronicDeviceDetailsState {
  final ElectronicDeviceDetailsScreenState screenState;

  ElectronicDeviceDetailsState(this.screenState);

  Widget getUI(BuildContext context);
}

class ElectronicDeviceDetailsStateInit extends ElectronicDeviceDetailsState {
  ElectronicDeviceDetailsStateInit(
      ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to ElectronicDeviceDetails Screen'),
    );
  }
}

class ElectronicDeviceDetailsStateLoading extends ElectronicDeviceDetailsState {
  ElectronicDeviceDetailsStateLoading(
      ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ElectronicDeviceDetailsStateUnauthorized
    extends ElectronicDeviceDetailsState {
  ElectronicDeviceDetailsStateUnauthorized(
      ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ElectronicDeviceDetailsStateDataLoaded
    extends ElectronicDeviceDetailsState {
  final ElectronicDeviceModel electronicDevice;
  final List<Widget> comments;
  ElectronicDeviceDetailsStateDataLoaded(this.electronicDevice, this.comments,
      ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);
  @override
  TextEditingController _comment = TextEditingController();
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).details,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ProjectColors.THEME_COLOR,
        actions: [
          IconButton(
            icon: Icon(Icons.report),
            onPressed: () {
              screenState.report();
            },
          ),
          electronicDevice.editable
              ? IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ProductsRoutes.ADD_ELECTRONIC_DEVICE_SCREEN,
                        arguments: electronicDevice);
                  },
                )
              : Container(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          screenState.getElectronicDeviceDetails();
          return Future.delayed(Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ProjectColors.THEME_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_iphone,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 250,
                        child: Center(
                          child: Text(
                            '${electronicDevice.title??''}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 65,
                            width: 65,
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage:
                                  NetworkImage('${electronicDevice.userImage}'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${electronicDevice.userName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    electronicDevice.isLoved
                        ? IconButton(
                            onPressed: () {
                              screenState.unLoveDevice(electronicDevice);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: ProjectColors.THEME_COLOR,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              screenState.loveDevice(electronicDevice);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: ProjectColors.THEME_COLOR,
                            ),
                          ),
                  ],
                ),

                // ElectronicDevice image
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: width,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(electronicDevice.image ??
                              'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: ProjectColors.THEME_COLOR,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ProductsRoutes.PRODUCT_IMAGES,
                              arguments: electronicDevice.images);
                        },
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.picture_in_picture,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              S.of(context).showPics,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //ElectronicDevice details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(S.of(context).type + ' : ${electronicDevice.type}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      S.of(context).brand + ' : ${electronicDevice.brand}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).descriptio +
                      ' : ${electronicDevice.description}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).location +
                      ' : ${electronicDevice.location}'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ProjectColors.THEME_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      S.of(context).price + ' : ${electronicDevice.price} \$',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {
                        screenState.getRoomId();
                      },
                      child: Text(
                        S.of(context).chatWithOwner,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {
                        screenState.getRoomIdWithLawyer();
                      },
                      child: Text(
                        S.of(context).chatWithLawyer,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ProjectColors.THEME_COLOR),
                    width: MediaQuery.of(context).size.width,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, left: 8.0, top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey[900]
                                      : ProjectColors.BACKGROUND_COLOR,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                controller: _comment,
                                decoration: InputDecoration(
                                  hintText: '${S.of(context).commentHint}',
                                  prefixIcon: Icon(Icons.comment),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(13),
                                ),
                                onChanged: (v) {
                                  screenState.refresh();
                                },
                                onEditingComplete: () =>
                                    FocusScope.of(context).unfocus(),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            splashRadius: 20,
                            icon: Icon(
                              Icons.check,
                            ),
                            disabledColor: Colors.grey,
                            color: Colors.white,
                            onPressed: _comment.text.isNotEmpty
                                ? () {
                                    screenState.placeComment(_comment.text,
                                        'device', electronicDevice.id);
                                  }
                                : null),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 4, left: 4),
                  child: Divider(
                    color: ProjectColors.THEME_COLOR,
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                  child: Text(
                    '${S.of(context).comments}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: comments,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ElectronicDeviceDetailsStateError extends ElectronicDeviceDetailsState {
  final String errorMsg;

  ElectronicDeviceDetailsStateError(
      this.errorMsg, ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}
