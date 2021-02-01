class ElectronicDeviceModel {
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
  bool isLoved;

  ElectronicDeviceModel({
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
  });
}
