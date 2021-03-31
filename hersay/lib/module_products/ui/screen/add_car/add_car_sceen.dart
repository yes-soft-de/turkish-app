
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_products/state_manager/car/add_car.state_manager.dart';
import 'package:hersay/module_products/ui/state/add_car/add_car.state.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:inject/inject.dart';

import '../../../products_routes.dart';

@provide
class AddCarScreen extends StatefulWidget {
  final AddCarStateManager  _stateManager;
  final AuthService _authService;

  AddCarScreen(
      this._stateManager,
      this._authService,
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
      int price,
      String description,
      String distance,
      String carType,
      String gearType,
      String location,
      String yearOfRelease,
      String image,
      String country,
      String city,
      String status,
      List<String> otherImages
      ) {
    widget._stateManager.addNewCar(price, description, distance, carType, gearType, location, yearOfRelease, image, country, city, status, otherImages, this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value){
      RouteHelper redirectTo = new RouteHelper(
          redirectTo: ProductsRoutes.ADD_CAR_SCREEN,
          additionalData: null
      );
      if(!value) {
        Navigator.of(context).pushNamed(
            AuthorizationRoutes.LOGIN_SCREEN,
            arguments: redirectTo
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
