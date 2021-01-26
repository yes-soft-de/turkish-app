import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hersay/module_products/state_manager/electroinic_device/add_electronic_device.state_manager.dart';
import 'package:hersay/module_products/ui/state/add_electronic_device/add_electronic_device.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class AddElectronicDeviceScreen extends StatefulWidget {
  final AddElectronicDeviceStateManager _stateManager;

  AddElectronicDeviceScreen(
      this._stateManager,
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
    return Scaffold(
      body: SafeArea(
        child: currentState.getUI(context),
      ),
    );
  }

}
