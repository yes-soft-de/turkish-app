
import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';

class RealEstateModel {
  int id;
  String type;
  String space;
  String floorsNumber;
  String cladding;
  String isFurnished;
  String address;
  String description;
  String price;
  String image;
  String userName;
  String userImage;
  bool isLoved;
  List<String> images;
  List<Comment> comments;
  RealEstateModel(
      {this.id,
      this.price,
      this.description,
      this.type,
      this.space,
      this.cladding,
      this.address,
      this.floorsNumber,
      this.isFurnished,
      this.image,
      this.userImage,
      this.userName,
      this.isLoved,
      this.images,
      this.comments});
}
