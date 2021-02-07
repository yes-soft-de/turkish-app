import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

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

  ElectronicDeviceDetailsStateDataLoaded(
      this.electronicDevice, ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
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
                  borderRadius: BorderRadius.circular(25),
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
                    Center(
                      child: Text(
                        '${electronicDevice.brand}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
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
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    //TODO : change this
                    color: ProjectColors.THEME_COLOR,
                    onPressed: () {
                      screenState.report();
                    },
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.report_problem,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          S.of(context).report,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
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
                        fit: BoxFit.fill,
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
                          SizedBox(width: 5,),
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
                child: Text(S.of(context).type + ' ${electronicDevice.type}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).brand + ' ${electronicDevice.brand}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).yearOfRelease +
                    '${electronicDevice.releaseYear}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).durationOfUse +
                    '${electronicDevice.useDuration}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    S.of(context).display + '${electronicDevice.description}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    S.of(context).processor + ' ${electronicDevice.processor}'),
              ),
              //TODO : change  this
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).storage + ' 512GB PCIe 3*4 SSD'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    S.of(context).graphics + ' ${electronicDevice.graphics}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    S.of(context).location + ' ${electronicDevice.location}'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                      S.of(context).price + '  ${electronicDevice.price} \$'),
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
            ],
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
