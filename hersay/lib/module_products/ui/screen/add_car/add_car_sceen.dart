
import 'package:flutter/material.dart';
import 'package:hersay/module_products/state_manager/car/add_car.state_manager.dart';
import 'package:hersay/module_products/ui/state/add_car/add_car.state.dart';
import 'package:inject/inject.dart';

@provide
class AddCarScreen extends StatefulWidget {
  final AddCarStateManager  _stateManager;

  AddCarScreen(
      this._stateManager,
      );

  @override
  AddCarScreenState createState() => AddCarScreenState();
}

class AddCarScreenState extends State<AddCarScreen> {
  AddCarState currentState;

  @override
  void initState() {
    super.initState();
    currentState = AddCarStateInit(this);
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

  void addNewCar(
      String brand,
      String company,
      String engine,
      int price,
      String description,
      String distance,
      String carType,
      String gearType,
      String cc,
      String fuel,
      String location,
      String yearOfRelease,
      String image,
      String country,
      String city,
      String state,
      String status, ) {
    widget._stateManager.addNewCar(brand, company, engine, price, description, distance, carType,
        gearType, cc, fuel, location, yearOfRelease, image, country, city, state, status, this);
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
