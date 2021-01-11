import 'package:hersay/utils/enums/products/products.dart';

class HomeModel {
  final String product;
  final String category;
  final String image;
  final String owner;
  final PRODUCT_TYPE type;
  final String specification;
  final int likes;

  HomeModel(
      {this.image,
      this.likes,
      this.category,
      this.owner,
      this.product,
      this.specification,
      this.type});
}
