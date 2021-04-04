import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_chat/chat_routes.dart';
import 'package:hersay/module_products/model/service/service.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/state_manager/service/service_details.state_manager.dart';
import 'package:hersay/module_products/ui/state/service_details/service_details.dart';
import 'package:hersay/module_report/report_routes.dart';
import 'package:hersay/utils/report_helper/report_helper.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

import 'package:inject/inject.dart';

@provide
class ServiceDetailsScreen extends StatefulWidget {
  final ServicesDetailsStateManager _stateManager;
  final AuthService _authService;

  ServiceDetailsScreen(
    this._stateManager,
    this._authService,
  );

  @override
  ServiceDetailsScreenState createState() => ServiceDetailsScreenState();
}

class ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  ServicesDetailsState currentState;
  int serviceId = 0;

  @override
  void initState() {
    super.initState();
    currentState = ServiceDetailsStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  void placeComment(String comment, String entity, int itemId) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.SERVICE_DETAILS_SCREEN,
            additionalData: serviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.placeComment(comment, entity, itemId, this);
      }
    });
  }

  void loveCar(ServiceModel service) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: serviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.loveCar(serviceId, this, service);
      }
    });
  }

  void unLoveCar(ServiceModel service) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.SERVICE_DETAILS_SCREEN,
            additionalData: serviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.unLoveCar(serviceId, this, service);
      }
    });
  }

  void refresh() {
    setState(() {});
  }

  void getServiceDetails() {
    widget._stateManager.getServicesDetails(this, serviceId);
  }

  void report() {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: serviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        ReportHelper report = new ReportHelper(
          entity: 'service',
          itemId: serviceId,
        );
        Navigator.of(context)
            .pushNamed(ReportRoutes.REPORT_SCREEN, arguments: report);
      }
    });
  }

  void getRoomId() {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.SERVICE_DETAILS_SCREEN,
            additionalData: serviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.getRoomId(serviceId, this);
      }
    });
  }

  void getRoomIdWithLawyer() {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.SERVICE_DETAILS_SCREEN,
            additionalData: serviceId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.getRoomIdWithLawyer(serviceId, this);
      }
    });
  }

  void goToChat(String roomId) {
    Navigator.pushNamed(context, ChatRoutes.chatRoute, arguments: roomId);
  }

  @override
  Widget build(BuildContext context) {
    if (currentState is ServiceDetailsStateInit) {
      serviceId = ModalRoute.of(context).settings.arguments;
      getServiceDetails();
    }

    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(
          context, S.of(context).details),
      body: currentState.getUI(context),
    );
  }
}
