class ElectronicDeviceRequest {
  String country;
  String brand;
  String type;
  String cpu;
  String ram;
  String battery;
  int price;
  String yearOfRelease;
  String description;
  String gauge;
  String city;
  String durationOfUse;
  String image;
  String status;
  String state;

  ElectronicDeviceRequest(
      {this.country,
        this.brand,
        this.type,
        this.cpu,
        this.ram,
        this.battery,
        this.price,
        this.yearOfRelease,
        this.description,
        this.gauge,
        this.city,
        this.durationOfUse,
        this.image,
        this.state,
        this.status,
      });



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['brand'] = this.brand;
    data['type'] = this.type;
    data['cpu'] = this.cpu;
    data['ram'] = this.ram;
    data['battery'] = this.battery;
    data['price'] = this.price;
    data['yearOfRelease'] = this.yearOfRelease;
    data['description'] = this.description;
    data['gauge'] = this.gauge;
    data['city'] = this.city;
    data['durationOfUse'] = this.durationOfUse;
    data['image'] = this.image;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }
}
