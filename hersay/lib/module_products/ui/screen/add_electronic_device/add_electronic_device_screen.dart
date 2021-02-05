
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/state_manager/electroinic_device/add_electronic_device.state_manager.dart';
import 'package:hersay/module_products/ui/state/add_electronic_device/add_electronic_device.state.dart';
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
      String country,
      String brand,
      String type,
      String cpu,
      String ram,
      String battery,
      int price,
      String yearOfRelease,
      String description,
      String gauge,
      String city,
      String durationOfUse,
      String mainImage,
      String state,
      String status,){
    widget._stateManager.addNewElectronicDevice(country, brand, type, cpu, ram, battery, price,
        yearOfRelease, description, gauge, city, durationOfUse, mainImage, state, status, this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        Navigator.of(context).pushNamed(
            AuthorizationRoutes.LOGIN_SCREEN,
            arguments: ProductsRoutes.ADD_ELECTRONIC_DEVICE_SCREEN
        );
      }
    }
    );

    return Scaffold(
      body: SafeArea(
        child: currentState.getUI(context),
      ),
    );
  }

}
