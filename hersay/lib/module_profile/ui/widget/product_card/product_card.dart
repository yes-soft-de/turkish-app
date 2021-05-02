import 'package:flutter/material.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/widgets/icon_text/icon_text_widget.dart';

class ProductCard extends StatelessWidget {
  final String product;
  final String category;
  final String image;
  final PRODUCT_TYPE type;
  final int likes;
  final int comments;
  ProductCard(
      {this.image,
      this.likes,
      this.category,
      this.product,
      this.type,
      this.comments});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getRightIcon(type),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$product',
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      '$category',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image ?? '',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconTextWidget(icon: Icons.favorite, text: '$likes'),
                IconTextWidget(icon: Icons.comment, text: '$comments'),
//                Icon(
//                  Icons.share,
//                  color: Colors.grey,
//                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Icon _getRightIcon(PRODUCT_TYPE type) {
    Icon icon;
    switch (type) {
      case PRODUCT_TYPE.CAR:
        icon = Icon(
          Icons.directions_car,
          color: Colors.grey,
        );
        break;
      case PRODUCT_TYPE.ELECTRONIC_DEVICE:
        icon = Icon(
          Icons.phone_iphone,
          color: Colors.grey,
        );
        break;
      case PRODUCT_TYPE.REAL_ESTATE:
        icon = Icon(
          Icons.home,
          color: Colors.grey,
        );
        break;
      case PRODUCT_TYPE.ADVERTISMENT:
        icon = Icon(
          Icons.design_services,
          color: Colors.grey,
        );
        break;
    }

    return icon;
  }
}
