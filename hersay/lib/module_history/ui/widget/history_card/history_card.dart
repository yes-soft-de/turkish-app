import 'package:flutter/material.dart';
import 'package:hersay/utils/enums/products/products.dart';

class HistoryCard extends StatelessWidget {
  final String product;
  final String operationType;
  final String date;

  HistoryCard({this.product, this.operationType, this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Container(
        height: 75,
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[175],
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _iconText(icon: Icons.history, text: '$product'),
            Text('($operationType)'),
            Text('($date)'),
          ],
        ),
      ),
    );
  }

  IconData _getRightIcon(PRODUCT_TYPE type) {
    IconData icon;
    switch (type) {
      case PRODUCT_TYPE.CAR:
        icon = Icons.directions_car;
        break;
      case PRODUCT_TYPE.ELECTRONIC_DEVICE:
        icon = Icons.phone_iphone;
        break;
      case PRODUCT_TYPE.REAL_ESTATE:
        icon = Icons.home;
        break;
    }

    return icon;
  }

  Widget _iconText({String text, IconData icon}) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Text('$text'),
      ],
    );
  }
}
