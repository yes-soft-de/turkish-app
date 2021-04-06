class RealEstateRequest {
  int id;
  String country;
  String city;
  String space;
  int price;
  String description;
  String image;
  String numberOfFloors;
  String homeFurnishing;
  String realEstateType;
  String status;

  RealEstateRequest({
    this.id,
    this.country,
    this.city,
    this.space,
    this.price,
    this.description,
    this.image,
    this.numberOfFloors,
    this.homeFurnishing,
    this.realEstateType,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['country'] = this.country;
    data['city'] = this.city;
    data['space'] = this.space;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['numberOfFloors'] = this.numberOfFloors;
    data['homeFurnishing'] = this.homeFurnishing;
    data['realEstateType'] = this.realEstateType;
    data['status'] = this.status;
    return data;
  }
}
