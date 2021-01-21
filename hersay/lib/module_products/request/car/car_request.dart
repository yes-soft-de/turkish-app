class CarRequest {
  String brand;
  String company;
  String engine;
  int price;
  String description;
  String distance;
  String carType;
  String gearType;
  String cc;
  String fuel;
  String location;
  String yearOfRelease;
  String image;
  String country;
  String city;
  String state;
  String status;

  CarRequest(
      {this.brand,
        this.company,
        this.engine,
        this.price,
        this.description,
        this.distance,
        this.carType,
        this.gearType,
        this.cc,
        this.fuel,
        this.location,
        this.yearOfRelease,
        this.image,
        this.country,
        this.city,
        this.state,
        this.status,
      });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['company'] = this.company;
    data['engine'] = this.engine;
    data['price'] = this.price;
    data['description'] = this.description;
    data['distance'] = this.distance;
    data['carType'] = this.carType;
    data['gearType'] = this.gearType;
    data['cc'] = this.cc;
    data['fuel'] = this.fuel;
    data['location'] = this.location;
    data['yearOfRelease'] = this.yearOfRelease;
    data['image'] = this.image;
    data['country'] = this.country;
    data['city'] = this.city;
    data['status'] = this.status;
    data['state'] = this.state;
    return data;
  }
}
