import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return _screenUi(height);
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
