import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';

class ElectronicDeviceModel {
  int id;
  String type;
  String brand;
  String releaseYear;
  String useDuration;
  String description;
  String processor;
  String storage;
  String graphics;
  String location;
  String price;
  String image;
  String userName;
  String userImage;
  String country;
  String city;
  bool editable;
  bool isLoved;
  List<String> images;
  List<Comment> comments;
  String title;
  ElectronicDeviceModel(
      {this.id,
      this.price,
      this.brand,
      this.useDuration,
      this.location,
      this.type,
      this.description,
      this.graphics,
      this.processor,
      this.releaseYear,
      this.storage,
      this.image,
      this.userName,
      this.userImage,
      this.isLoved,
      this.images,
      this.comments,
      this.city,
      this.country,
      this.editable,
      this.title
      });
}
