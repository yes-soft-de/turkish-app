import 'package:flutter/material.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart';
import 'package:hersay/module_products/ui/screen/add_house/add_house_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:animate_icons/animate_icons.dart';

class VerticalFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  VerticalFab({this.onPressed, this.tooltip, this.icon});

  @override
  _VerticalFabState createState() => _VerticalFabState();
}

class _VerticalFabState extends State<VerticalFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  AnimateIconController controller;

  @override
  initState() {
    controller = AnimateIconController();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: ProjectColors.THEME_COLOR,
      end: Colors.red,
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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddElectronicDeviceScreen()));
        },
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCarScreen()));
        },
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
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddHouseScreen()));
        },
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: mobile(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 1.5,
            0.0,
          ),
          child: car(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: home(),
        ),
        toggle(),
      ],
    );
  }
}
