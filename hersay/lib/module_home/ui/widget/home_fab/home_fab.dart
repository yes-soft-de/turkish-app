import 'dart:math';

import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class HomeFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  HomeFab({this.onPressed, this.tooltip, this.icon});

  @override
  _HomeFabState createState() => _HomeFabState();
}

class _HomeFabState extends State<HomeFab> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 0.0;

  AnimateIconController controller;

  @override
  initState() {
    controller = AnimateIconController();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 500),vsync: this)
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: ProjectColors.THEME_COLOR,
      end: ProjectColors.THEME_COLOR,
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
      end: -14,
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

  Widget mobile() {
    return Container(
      width: 37,
      height: 37,
      child: FloatingActionButton(
        heroTag: 'device',
        backgroundColor: ProjectColors.THEME_COLOR,
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.mobile_screen_share),
      ),
    );
  }

  Widget car() {
    return Container(
      width: 37,
      height: 37,
      child: FloatingActionButton(
        heroTag: 'car',
        backgroundColor: ProjectColors.THEME_COLOR,
        onPressed: null,
        tooltip: 'Image',
        child: Icon(Icons.directions_car),
      ),
    );
  }

  Widget home() {
    return Container(
      width: 37,
      height: 37,
      child: FloatingActionButton(
        heroTag: 'house',
        backgroundColor: ProjectColors.THEME_COLOR,
        onPressed: null,
        tooltip: 'Inbox',
        child: Icon(Icons.home),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        backgroundColor: _buttonColor.value,
        tooltip: 'Toggle',
        child: AnimateIcons(
          startIcon: Icons.add,
          endIcon: Icons.close,
          size: 30.0,
          controller: controller,
          // add this tooltip for the start icon
          startTooltip: 'Icons.add_circle',
          // add this tooltip for the end icon
          endTooltip: 'Icons.add_circle_outline',
          onStartIconPress: () {
            animate();
            return true;
          },
          onEndIconPress: () {
            animate();
            return true;
          },
          duration: Duration(milliseconds: 500),
          color: Colors.grey,
          clockwise: false,
        ),
//          progress: _animateIcon,
//        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(
                          _translateButton.value * 4,
                          0.0,
                          0.0,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              print('mobile');
                            },
                            child: mobile()),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                          _translateButton.value * 3,
                          _translateButton.value * 3,
                          0.0,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              print('car');
                            },
                            child: car()),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                          0.0,
                          _translateButton.value * 3.5,
                          0.0,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              print('home');
                            },
                            child: home()),
                      ),
                      toggle()
                    ],
                  ),
                )
              ],
            )
          ],
        ));

//      Column(
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        GestureDetector(
//          onTap: (){
//            print('lolo');
//          },
//          child: Transform(
//            transform: Matrix4.translationValues(
//              _translateButton.value * 6,
//              0.0 ,
//              0.0,
//            ),
//            child: mobile(),
//          ),
//        ),
//        Transform(
//          transform: Matrix4.translationValues(
//            _translateButton.value * 3,
//            _translateButton.value * 3,
//            0.0,
//          ),
//          child: car(),
//        ),
//        Transform(
//          transform: Matrix4.translationValues(
//            0.0,
//            _translateButton.value * 3.5,
//            0.0,
//          ),
//          child: home(),
//        ),
//        toggle(),
//      ],
//    );
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key key, this.controller, this.scale})
      :

        // ...omitted

        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;

  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Stack(alignment: Alignment.center, children: [
            _buildButton(0, color: Colors.red, icon: Icons.favorite),
            _buildButton(45, color: Colors.green, icon: Icons.favorite),
            _buildButton(90, color: Colors.orange, icon: Icons.favorite),
            _buildButton(135, color: Colors.blue, icon: Icons.favorite),
            _buildButton(180, color: Colors.black, icon: Icons.favorite),
            _buildButton(225, color: Colors.indigo, icon: Icons.favorite),
            _buildButton(270, color: Colors.pink, icon: Icons.favorite),
            _buildButton(315, color: Colors.yellow, icon: Icons.favorite),
            // ...omitted
          ]);
        });
  }

  _buildButton(double angle, {Color color, IconData icon}) {
    final double rad = angle * (pi / 180.0);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            onPressed: _close,
            elevation: 0));
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
