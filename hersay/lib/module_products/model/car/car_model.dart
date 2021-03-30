import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';

class CarModel {
  int id;
  String type;
  String brand;
  String distance;
  String gearType;
  String cc;
  String fuel;
  String location;
  String price;
  String useDuration;
  String cylinder;
  String image;
  String userName;
  String userImage;
  bool isLoved;
  List<String> images;
  List<Comment> comments;
  CarModel({
    this.id,
    this.type,
    this.brand,
    this.distance,
    this.location,
    this.fuel,
    this.gearType,
    this.price,
    this.cc,
    this.useDuration,
    this.cylinder,
    this.image,
    this.userImage,
    this.userName,
    this.isLoved,
    this.images,
    this.comments
  });
}
