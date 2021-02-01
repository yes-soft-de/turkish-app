import 'package:flutter/material.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/widgets/icon_text/icon_text_widget.dart';

class ProductCard extends StatelessWidget {
  final String product;
  final String category;
  final String image;
  final String owner;
  final String ownerImage;
  final PRODUCT_TYPE type;
  final String specification;
  final int likes;

  ProductCard(
      {this.image,
      this.likes,
      this.category,
      this.owner,
      this.ownerImage,
      this.product,
      this.specification,
      this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              height: 165,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    image ?? '',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              '${ownerImage}'),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text('$owner'),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  child: Text(
                    '$specification'
                  ),
                ),
//                IconTextWidget(icon: null, text: '$specification'),
                IconTextWidget(icon: Icons.favorite, text: '$likes'),
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
    }

    return icon;
  }
}
