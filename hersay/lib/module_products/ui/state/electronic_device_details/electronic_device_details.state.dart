
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
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
                // device model
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 65,
                        width: 65,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                              '${electronicDevice.userImage}'),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
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
                      electronicDevice.isLoved
                          ? Icon(
                        Icons.favorite,
                        color: ProjectColors.THEME_COLOR,
                      )
                          : IconButton(
                        onPressed: (){

                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: ProjectColors.THEME_COLOR,
                        ),
                      ),
                    ],
                  ),
                ),
                // owner

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                  child: Text(S.of(context).type+' ${electronicDevice.type}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).brand+' ${electronicDevice.brand}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).yearOfRelease+'${electronicDevice.releaseYear}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).durationOfUse+'${electronicDevice.useDuration}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).display+'${electronicDevice.description}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).processor+' ${electronicDevice.processor}'),
                ),
                //TODO : change  this
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).storage+' 512GB PCIe 3*4 SSD'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).graphics+' ${electronicDevice.graphics}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).location+' ${electronicDevice.location}'),
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
                    child: Text(S.of(context).price+'${electronicDevice.price} \$'),
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
                      onPressed: () {},
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

  ElectronicDeviceDetailsStateError(this.errorMsg, ElectronicDeviceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}