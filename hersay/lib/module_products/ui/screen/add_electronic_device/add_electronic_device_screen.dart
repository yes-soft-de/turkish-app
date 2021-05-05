import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/state_manager/electroinic_device/add_electronic_device.state_manager.dart';
import 'package:hersay/module_products/ui/state/add_electronic_device/add_electronic_device.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:inject/inject.dart';

@provide
class AddElectronicDeviceScreen extends StatefulWidget {
  final AddElectronicDeviceStateManager _stateManager;
  final AuthService _authService;

  AddElectronicDeviceScreen(
    this._stateManager,
    this._authService,
  );

  @override
  AddElectronicDeviceScreenState createState() =>
      AddElectronicDeviceScreenState();
}

class AddElectronicDeviceScreenState extends State<AddElectronicDeviceScreen> {
  AddElectronicDeviceState currentState;

  @override
  void initState() {
    super.initState();
    currentState = AddElectronicDeviceStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
  }

  void refresh() {
    setState(() {});
  }

  void addNewElectronicDevice(
      String title,
      String country,
      String brand,
      String type,
      int price,
      String description,
      String city,
      String mainImage,
      String state,
      String status,
      List<String> otherImages) {
    widget._stateManager.addNewElectronicDevice(title, country, brand, type,
        price, description, city, mainImage, state, status, otherImages, this);
  }

  void updateElectronicDevice(
      int id,
      String title,
      String country,
      String brand,
      String type,
      int price,
      String description,
      String city,
      String mainImage,
      String state,
      String status,
      List<String> otherImages) {
    widget._stateManager.updateElectronicDevice(id, title, country, brand, type,
        price, description, city, mainImage, state, status, otherImages, this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.ADD_ELECTRONIC_DEVICE_SCREEN,
            additionalData: null);

        Navigator.of(context)
            .pushNamed(AuthorizationRoutes.LOGIN_SCREEN, arguments: redirectTo);
      }
    });

    return WillPopScope(
      onWillPop: () async {
        var additionalData = ModalRoute.of(context).settings.arguments;
        if (additionalData != null && additionalData is bool) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MainRoutes.MAIN_SCREEN_ROUTE, (route) => false);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: currentState.getUI(context),
      ),
    );
  }
}
