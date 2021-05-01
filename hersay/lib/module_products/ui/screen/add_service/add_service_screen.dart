import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_products/state_manager/car/add_car.state_manager.dart';
import 'package:hersay/module_products/state_manager/service/add_service_state_manager.dart';
import 'package:hersay/module_products/ui/state/add_car/add_car.state.dart';
import 'package:hersay/module_products/ui/state/add_service/add_service.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:inject/inject.dart';

import '../../../products_routes.dart';

@provide
class AddServiceScreen extends StatefulWidget {
  final AddServiceStateManager _stateManager;
  final AuthService _authService;

  AddServiceScreen(
    this._stateManager,
    this._authService,
  );

  @override
  AddServiceScreenState createState() => AddServiceScreenState();
}

class AddServiceScreenState extends State<AddServiceScreen> {
  AddServiceState currentState;

  @override
  void initState() {
    super.initState();
    currentState = AddServiceStateInit(this);
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

  void addNewService(
    String title,
    String type,
    String description,
    String image,
  ) {
    widget._stateManager.addNewService(type, title, description, image, this);
  }

  void updateService(
      int id, String title, String type, String description, String image) {
    widget._stateManager
        .updateService(id, type, title, description, image, this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value) {
      RouteHelper redirectTo = new RouteHelper(
          redirectTo: ProductsRoutes.ADD_SERVICE_SCREEN, additionalData: null);
      if (!value) {
        Navigator.of(context)
            .pushNamed(AuthorizationRoutes.LOGIN_SCREEN, arguments: redirectTo);
      }
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ProjectColors.THEME_COLOR,
        title: Text(S.of(context).details),
      ),
      body: SafeArea(
        child: currentState.getUI(context),
      ),
    );
  }
}
