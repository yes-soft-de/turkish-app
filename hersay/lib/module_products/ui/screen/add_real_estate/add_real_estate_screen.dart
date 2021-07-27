import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_products/state_manager/real_estate/add_real_estate.manager.dart';
import 'package:hersay/module_products/ui/state/add_real_estate/add_real_estate.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:inject/inject.dart';

import '../../../products_routes.dart';

@provide
class AddRealEstateScreen extends StatefulWidget {
  final AddRealEstateStateManager _stateManager;
  final AuthService _authService;

  AddRealEstateScreen(
    this._stateManager,
    this._authService,
  );

  @override
  AddRealEstateScreenState createState() => AddRealEstateScreenState();
}

class AddRealEstateScreenState extends State<AddRealEstateScreen> {
  AddRealEstateState currentState;

  @override
  void initState() {
    super.initState();
    currentState = AddRealEstateStateInit(this);
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

  void addNewRealEstate(
      String title,
      String country,
      String city,
      String space,
      int price,
      String description,
      String numberOfFloors,
      String homeFurnishing,
      String realEstateType,
      String status,
      String mainImage,
      List<String> otherImages) {
    widget._stateManager.addNewRealEstate(
        title,
        country,
        city,
        space,
        price,
        description,
        numberOfFloors,
        homeFurnishing,
        realEstateType,
        status,
        mainImage,
        otherImages,
        this);
  }

  void updateRealEstate(
      int id,
      String title,
      String country,
      String city,
      String space,
      int price,
      String description,
      String numberOfFloors,
      String homeFurnishing,
      String realEstateType,
      String status,
      String mainImage,
      List<String> otherImages) {
    widget._stateManager.updateRealEstate(
        id,
        title,
        country,
        city,
        space,
        price,
        description,
        numberOfFloors,
        homeFurnishing,
        realEstateType,
        status,
        mainImage,
        otherImages,
        this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.ADD_REAL_ESTATE_SCREEN,
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
