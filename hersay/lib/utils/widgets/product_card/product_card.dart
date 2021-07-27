import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
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
  final int comments;
  final VoidCallback onBlock;
  ProductCard(
      {this.image,
      this.likes,
      this.category,
      this.owner,
      this.ownerImage,
      this.product,
      this.specification,
      this.type,
      this.comments,
      this.onBlock});

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
                SizedBox(
                  width: 8,
                ),
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
                ),
                Spacer(
                  flex: 1,
                ),
                IconButton(
                    icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ProjectColors.THEME_COLOR,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.block,
                          color: Colors.white,
                        ))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(S.of(context).warning),
                              content: Container(
                                child: Text(S.of(context).blockUser),
                              ),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      onBlock();
                                    },
                                    child: Text(S.of(context).ok)),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(S.of(context).cancel)),
                              ],
                            );
                          });
                    }),
              ],
            ),
            Container(
              height: 165,
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
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage('${ownerImage}'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$owner',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
//                IconTextWidget(icon: null, text: '$specification'),
                Spacer(
                  flex: 1,
                ),
                IconTextWidget(icon: Icons.favorite, text: '$likes'),
                SizedBox(
                  width: 16,
                ),
                IconTextWidget(icon: Icons.comment, text: '$comments'),
                SizedBox(
                  width: 8,
                )
//                Icon(
//                  Icons.share,
//                  color: Colors.grey,
//                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width - 64,
              child: Center(
                child: Text(
                  '$specification',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
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
