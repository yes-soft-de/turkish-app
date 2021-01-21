class RealEstateRequest {
  String country;
  String city;
  String space;
  int price;
  String description;
  String image;
  String numberOfFloors;
  String cladding;
  String homeFurnishing;
  String realEstateType;
  String rooms;
  String status;
  String state;

  RealEstateRequest(
      {this.country,
        this.city,
        this.space,
        this.price,
        this.description,
        this.image,
        this.numberOfFloors,
        this.cladding,
        this.homeFurnishing,
        this.realEstateType,
        this.rooms,
        this.status,
        this.state});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['space'] = this.space;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['numberOfFloors'] = this.numberOfFloors;
    data['cladding'] = this.cladding;
    data['homeFurnishing'] = this.homeFurnishing;
    data['realEstateType'] = this.realEstateType;
    data['rooms'] = this.rooms;
    data['status'] = this.status;
    data['state'] = this.state;
    return data;
  }
}
