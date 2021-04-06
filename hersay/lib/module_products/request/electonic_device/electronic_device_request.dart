class ElectronicDeviceRequest {
  int id;
  String country;
  String brand;
  String type;
  int price;
  String description;
  String city;
  String image;
  String status;
  String state;

  ElectronicDeviceRequest({
    this.id,
    this.country,
    this.brand,
    this.type,
    this.price,
    this.description,
    this.city,
    this.image,
    this.state,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['country'] = this.country;
    data['brand'] = this.brand;
    data['type'] = this.type;
    data['price'] = this.price;
    data['description'] = this.description;
    data['city'] = this.city;
    data['image'] = this.image;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }
}
