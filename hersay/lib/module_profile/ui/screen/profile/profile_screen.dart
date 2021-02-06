import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_profile/profile_routes.dart';
import 'package:hersay/module_profile/state_manager/profile/profile.state_manager.dart';
import 'package:hersay/module_profile/ui/state/profile/profile.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class ProfileScreen extends StatefulWidget {
  final ProfileStateManager _stateManager;
  final AuthService _authService;

  ProfileScreen(
      this._stateManager,
      this._authService,
      );

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProfileState currentState;

  @override
  void initState() {
    super.initState();
    currentState = ProfileStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if(this.mounted){
        setState(() {

        });
      }
    });
  }

  void getProfile(){
    widget._stateManager.getProfileScreenData(this);
  }

  void refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProfileRoutes.PROFILE_SCREEN,
            additionalData: null
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }
      });

    if (currentState is ProfileStateInit) {

      getProfile();
    }


    return  Scaffold(

      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, S.of(context).profile),

      body: currentState.getUI(context),
    );
  }

  Widget _screenUi(double height) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).profile),
      drawer: TurkishNavigationDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3L3H3l0sputiPxI2VL4XSLHfBo1qgmJlabw&usqp=CAU'),
                        fit: BoxFit.cover)),
//            child: Container(
//              width: double.infinity,
//              height: 175,
//              //profile image
//              child: Container(
//                alignment: Alignment(0.0,2.5),
//                child: CircleAvatar(
//                  radius: 46.0,
//                 backgroundColor: ProjectColors.THEME_COLOR,
//                  child: CircleAvatar(
//                    backgroundImage: NetworkImage(
//                            'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=100&q=60 100w'
//                    ),
//                    radius: 44.0,
//                  ),
//                ),
//              ),
//            ),
              ),
              Container(
                height: 50,
                color: ProjectColors.SECONDARY_COLOR,
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Zolfekar Seleten',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Container(
                      height: 40,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          color: ProjectColors.SECONDARY_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                color: Colors.black12,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).editAccount,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 40,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit,
                              color: ProjectColors.SECONDARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                      children: [
//                        Text(
//                          'Delete Account',
//                          style: TextStyle(
//                            fontSize: 14,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        Container(
//                          height: 40,
//                          child: FloatingActionButton(
//                            onPressed: () {},
//                            backgroundColor: Colors.white,
//                            child: Icon(
//                              Icons.delete,
//                              color: ProjectColors.SECONDARY_COLOR,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
