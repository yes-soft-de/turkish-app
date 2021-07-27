import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';

class ServiceModel {
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
  String title;
  bool editable;
  int categoryId;
  String categoryName;
  String country;
  String city;
  ServiceModel(
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
      this.comments,
      this.title,
      this.editable,
      this.categoryId,
      this.categoryName,
      this.country,
      this.city
      });
}
