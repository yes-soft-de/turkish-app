class CarRequest {
  int id;
  int price;
  String description;
  String distance;
  String carType;
  String gearType;
  String location;
  String yearOfRelease;
  String image;
  String country;
  String city;
  String status;

  CarRequest({
    this.id,
    this.price,
    this.description,
    this.distance,
    this.carType,
    this.gearType,
    this.location,
    this.yearOfRelease,
    this.image,
    this.country,
    this.city,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['price'] = this.price;
    data['description'] = this.description;
    data['distance'] = this.distance;
    data['carType'] = this.carType;
    data['gearType'] = this.gearType;
    data['location'] = this.location;
    data['yearOfProduction'] = this.yearOfRelease;
    data['image'] = this.image;
    data['country'] = this.country;
    data['city'] = this.city;
    data['status'] = this.status;
    return data;
  }
}
