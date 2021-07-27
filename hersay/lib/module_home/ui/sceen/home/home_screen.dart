import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_home/home_routes.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/state_manager/home/home.state_manager.dart';
import 'package:hersay/module_home/ui/state/home/home.state.dart';
import 'package:hersay/module_home/ui/widget/vertical_fab/vertical_fab.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_profile/model/profile/profile_model.dart';
import 'package:hersay/module_splash/splash_routes.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/widgets/product_card/product_card.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';
import 'package:flutter/services.dart' show rootBundle;

@provide
class HomeScreen extends StatefulWidget {
  final HomeStateManager _stateManager;

  HomeScreen(
    this._stateManager,
  );

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeState currentState;
  ProfileModel profileModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    currentState = HomeStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    widget._stateManager.profileStream.listen((event) {
      profileModel = event;
      if (mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getHomeScreenData(this);
    widget._stateManager.getProfile(this);
  }

  void refresh() {
    setState(() {});
  }

  void getHomeScreenData() {
    widget._stateManager.getHomeScreenData(this);
  }

  void getProfileData() {
    widget._stateManager.getProfile(this);
  }

  void onBlock(String owner) {
    widget._stateManager.onBlock(owner).whenComplete(() =>
        Navigator.pushNamedAndRemoveUntil(
            context, HomeRoutes.Home_SCREEN_ROUTE, (route) => false));
  }

  Future<String> getText() async {
    return await rootBundle.loadString('assets/text/eula.txt');
  }

  void showEulaDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).warning),
            scrollable: true,
            content: Container(
              child: FutureBuilder(
                future: getText(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Text(snapshot.data);
                  }
                },
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    widget._stateManager.setEulaState();
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).accept)),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SplashRoutes.BLOCK_SCREEN, (route) => false);
                  },
                  child: Text(S.of(context).unaccept)),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: TurkishNavigationDrawer(),
      appBar: TurkishAppBar.getTurkishAppBar(
          context, _scaffoldKey, S.of(context).home),
      body: currentState.getUI(context),
      floatingActionButton: VerticalFab(),
    );
  }
}
