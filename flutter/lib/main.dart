import 'package:flutter/material.dart';

import 'module_chat/ui/screen/chats_list/chats_list_screen.dart';
import 'module_history/ui/screen/history/history_screen.dart';
import 'module_home/ui/sceen/home/home_screen.dart';
import 'module_profile/ui/screen/profile/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatsListScreen(),
    );
  }
}



class HomeFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  HomeFab({this.onPressed, this.tooltip, this.icon});

  @override
  _HomeFabState createState() => _HomeFabState();
}

class _HomeFabState extends State<HomeFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.blue,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return Container(
      height: 37,
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.mobile_screen_share),
      ),
    );
  }

  Widget image() {
    return Container(
      height: 37,
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Image',
        child: Icon(Icons.directions_car),
      ),
    );
  }

  Widget inbox() {
    return Container(
      height: 37,
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Inbox',
        child: Icon(Icons.home),

      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.add_event,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 4.5,
            130 ,
            0.0,
          ),
          child: add(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 3.3,
            45,
            0.0,
          ),
          child: image(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: inbox(),
        ),
        toggle(),
      ],
    );
  }
}







//
//import 'package:flutter/material.dart';
//import 'dart:math';
//import 'package:vector_math/vector_math.dart' show radians, Vector3;
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    return MaterialApp(
//        title: 'FlutterBase',
//        home: Scaffold(
//            body: SizedBox.expand(child: RadialMenu())
//        )
//    );
//  }
//}
//
//class RadialMenu extends StatefulWidget {
//  createState() => _RadialMenuState();
//}
//
//class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {
//
//  AnimationController controller;
//
//  @override
//  void initState() {
//    super.initState();
//    controller = AnimationController(duration: Duration(milliseconds: 900), vsync: this);
//    // ..addListener(() => setState(() {}));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return RadialAnimation(controller: controller);
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//}
//
//
//class RadialAnimation extends StatelessWidget {
//  RadialAnimation({ Key key, this.controller }) :
//
//        translation = Tween<double>(
//          begin: 0.0,
//          end: 100.0,
//        ).animate(
//          CurvedAnimation(
//              parent: controller,
//              curve: Curves.elasticOut
//          ),
//        ),
//
//        scale = Tween<double>(
//          begin: 1.5,
//          end: 0.0,
//        ).animate(
//          CurvedAnimation(
//              parent: controller,
//              curve: Curves.fastOutSlowIn
//          ),
//        ),
//
//        rotation = Tween<double>(
//          begin: 0.0,
//          end: 360.0,
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.0, 0.7,
//              curve: Curves.decelerate,
//            ),
//          ),
//        ),
//
//        super(key: key);
//
//  final AnimationController controller;
//  final Animation<double> rotation;
//  final Animation<double> translation;
//  final Animation<double> scale;
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//        animation: controller,
//        builder: (context, widget) {
//          return Transform.rotate(
//              angle: radians(rotation.value),
//              child: Stack(
//                  alignment: Alignment.center,
//                  children: <Widget>[
//                    _buildButton(0, color: Colors.red, icon: Icons.favorite),
//                    _buildButton(45, color: Colors.green, icon: Icons.favorite),
//                    _buildButton(90, color: Colors.orange, icon: Icons.favorite),
//                    _buildButton(135, color: Colors.blue, icon: Icons.favorite),
//                    _buildButton(180, color: Colors.black, icon: Icons.favorite),
//                    _buildButton(225, color: Colors.indigo, icon: Icons.favorite),
//                    _buildButton(270, color: Colors.pink, icon: Icons.favorite),
//                    _buildButton(315, color: Colors.yellow, icon: Icons.favorite),
//                    Transform.scale(
//                      scale: scale.value - 1,
//                      child: FloatingActionButton(child: Icon(Icons.add), onPressed: _close, backgroundColor: Colors.red),
//                    ),
//                    Transform.scale(
//                      scale: scale.value,
//                      child: FloatingActionButton(child: Icon(Icons.close), onPressed: _open),
//                    )
//
//                  ])
//          );
//        });
//  }
//
//  _open() {
//    controller.forward();
//  }
//
//  _close() {
//    controller.reverse();
//  }
//
//  _buildButton(double angle, { Color color, IconData icon }) {
//    final double rad = radians(angle);
//    return Transform(
//        transform: Matrix4.identity()..translate(
//            (translation.value) * cos(rad),
//            (translation.value) * sin(rad)
//        ),
//
//        child: FloatingActionButton(
//
//            child: Icon(icon), backgroundColor: color, onPressed: _close, elevation: 0)
//    );
//  }
//}