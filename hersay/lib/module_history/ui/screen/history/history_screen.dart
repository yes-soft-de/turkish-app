

import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_history/history_routes.dart';
import 'package:hersay/module_history/state_manager/history/history.state_manger.dart';
import 'package:hersay/module_history/ui/state/history/history.state.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class HistoryScreen extends StatefulWidget {
  final HistoryStateManager _stateManager;
  final AuthService _authService;

  HistoryScreen(
      this._stateManager,
      this._authService,
      );

  @override
   HistoryScreenState createState() =>  HistoryScreenState();
}

class  HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  HistoryState currentState;

  @override
  void initState() {
    super.initState();
    currentState = HistoryStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });

    widget._stateManager.getHistory(this);

  }

  void getHistory(){
    widget._stateManager.getHistory(this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: HistoryRoutes.HISTORY_ROUTE,
        );
      }
    });
    return    Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).history),
      drawer: TurkishNavigationDrawer(),
      body: currentState.getUI(context),
    );

  }

//  Widget _screenUi() {
//    return Scaffold(
//      key: _scaffoldKey,
//      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).history),
//      drawer: TurkishNavigationDrawer(),
//      body: ListView.builder(
//          itemCount: 10,
//          itemBuilder: (BuildContext context, int index) {
//            return Container(
//              padding: EdgeInsets.symmetric(vertical: 0),
//              child: HistoryCard(
//                product: 'Maclarn',
//                productType: PRODUCT_TYPE.CAR,
//                operationType: 'sell',
//              ),
//            );
//          }),
//    );
//  }
}
