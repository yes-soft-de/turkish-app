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
  String yearOfProdaction;
  List<Comment> comments;
  String discription;
  bool editable;
  String city;
  String country;
  CarModel(
      {this.id,
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
      this.yearOfProdaction,
      this.discription,
      this.editable,
      this.city,
      this.country,
      this.comments});
}
