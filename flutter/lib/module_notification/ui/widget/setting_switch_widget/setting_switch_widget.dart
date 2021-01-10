import 'package:flutter/material.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class SettingSwitchWidget extends StatefulWidget {
  final String text;

  SettingSwitchWidget({this.text});
  @override
  _SettingSwitchWidgetState createState() => _SettingSwitchWidgetState();
}

class _SettingSwitchWidgetState extends State<SettingSwitchWidget> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.text}'),
              Switch(
                value: isSwitched,
                onChanged: (isOn) {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                },
                activeTrackColor: ProjectColors.THEME_COLOR,
                activeColor: Colors.white,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
