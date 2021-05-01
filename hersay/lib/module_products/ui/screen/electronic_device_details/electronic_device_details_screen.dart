import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_chat/chat_routes.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/state_manager/electroinic_device/electronic_device_details.state_manager.dart';
import 'package:hersay/module_products/ui/state/electronic_device_details/electronic_device_details.state.dart';
import 'package:hersay/module_report/report_routes.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/report_helper/report_helper.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class ElectronicDeviceDetailsScreen extends StatefulWidget {
  final ElectronicDeviceDetailsStateManager _stateManager;
  final AuthService _authService;

  ElectronicDeviceDetailsScreen(
    this._stateManager,
    this._authService,
  );

  @override
  ElectronicDeviceDetailsScreenState createState() =>
      ElectronicDeviceDetailsScreenState();
}

class ElectronicDeviceDetailsScreenState
    extends State<ElectronicDeviceDetailsScreen> {
  ElectronicDeviceDetailsState currentState;
  int electronicDeviceId;
  double width;

  void loveDevice(ElectronicDeviceModel device) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: electronicDeviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.loveDevice(electronicDeviceId, this, device);
      }
    });
  }

  void unLoveDevice(ElectronicDeviceModel device) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: electronicDeviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.unLoveDevice(electronicDeviceId, this, device);
      }
    });
  }

  void getElectronicDeviceDetails() {
    widget._stateManager.getElectronicDeviceDetails(this, electronicDeviceId);
  }

  void getRoomId() {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN,
            additionalData: electronicDeviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.getRoomId(electronicDeviceId, this);
      }
    });
  }

  void placeComment(String comment,String entity, int itemId) {  
       widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN,
            additionalData: electronicDeviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.placeComment(comment,entity,itemId,this);
      }
    });
  }

  void getRoomIdWithLawyer() {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN,
            additionalData: electronicDeviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.getRoomIdWithLawyer(electronicDeviceId, this);
      }
    });
  }

  void report() {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN,
            additionalData: electronicDeviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        ReportHelper report = new ReportHelper(
          entity: 'device',
          itemId: electronicDeviceId,
        );
        Navigator.of(context)
            .pushNamed(ReportRoutes.REPORT_SCREEN, arguments: report);
      }
    });
  }

  void goToChat(String roomId) {
    Navigator.pushNamed(context, ChatRoutes.chatRoute, arguments: roomId);
  }

  @override
  void initState() {
    super.initState();
    currentState = ElectronicDeviceDetailsStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentState is ElectronicDeviceDetailsStateInit) {
      electronicDeviceId = ModalRoute.of(context).settings.arguments;
      getElectronicDeviceDetails();
    }

    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: currentState is ElectronicDeviceDetailsStateDataLoaded ? null : TurkishAppBar.getTurkishOrdinaryAppBar(
          context, S.of(context).details),
      body: currentState.getUI(context),
    );
  }

  Widget _screenUi() {
    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, ''),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // car model
              Text(
                'Dell XPS 2020',
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
                            'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png'))),
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
              Text('Type : Laptop'),
              Text('Brand : Dell'),
              Text('Year of Release : 2020'),
              Text('Duration of use : 4 Months'),
              Text('Display : 15.6-inch touchscreen (3840*2400)'),
              Text('Processor :  Intel Core i7-10875H'),
              Text('Storage : 512GB PCIe 3*4 SSD'),
              Text('Graphics : Nvidia GeForce GTX 1650 TI 4GB GDDR6'),
              Text('Location : 23CX+G7 Umraniey, istanbul, Turkey'),
              Center(
                child: Text('Price : 300,253 \$'),
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
