import 'package:flutter/material.dart';


class IconTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  IconTextWidget({
    this.text,
    this.icon,
});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(width: 5,),
        Text('$text'),
      ],
    );
  }
}
