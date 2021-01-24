
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';



abstract class ElectronicDeviceDetailsState {
  final ElectronicDeviceDetailsScreenState screenState;

  ElectronicDeviceDetailsState(this.screenState);

  Widget getUI(BuildContext context);
}

class ElectronicDeviceDetailsStateInit extends ElectronicDeviceDetailsState {
  ElectronicDeviceDetailsStateInit(ElectronicDeviceDetailsScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to ElectronicDeviceDetails Screen'),
    );
  }
}

class ElectronicDeviceDetailsStateLoading extends ElectronicDeviceDetailsState {
  ElectronicDeviceDetailsStateLoading(ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ElectronicDeviceDetailsStateUnauthorized extends ElectronicDeviceDetailsState {
  ElectronicDeviceDetailsStateUnauthorized(ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ElectronicDeviceDetailsStateDataLoaded extends ElectronicDeviceDetailsState {
  final ElectronicDeviceModel electronicDevice;

  ElectronicDeviceDetailsStateDataLoaded(this.electronicDevice, ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
        onRefresh: () {
          screenState.getElectronicDeviceDetails();
          return Future.delayed(Duration(seconds: 3));
        },
        child:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // car model
                Text(
                  '${electronicDevice.brand}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                // owner
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      //TODO : change this
                      'Edward Josh',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // ElectronicDevice image
                Container(
                  width: width,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              electronicDevice.image?? 'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png'))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {},
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Icon(
                            Icons.picture_in_picture,
                            color: Colors.white,
                          ),
                          Text(
                            'Show Pics',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),

                //ElectronicDevice details
                Text('Type : ${electronicDevice.type}'),
                Text('Brand : ${electronicDevice.brand}'),
                Text('Year of Release : ${electronicDevice.releaseYear}'),
                Text('Duration of use : ${electronicDevice.useDuration}'),
                Text('Display :${electronicDevice.description}'),
                Text('Processor :  ${electronicDevice.processor}'),
                //TODO : change  this
                Text('Storage : 512GB PCIe 3*4 SSD'),
                Text('Graphics : ${electronicDevice.graphics}'),
                Text('Location : ${electronicDevice.location}'),
                Center(
                  child: Text('Price : ${electronicDevice.price} \$'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {},
                      child: Text(
                        'Request Lawer',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {},
                      child: Text(
                        'Request Chat',
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

  ElectronicDeviceDetailsStateError(this.errorMsg, ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}