class ServiceRequest {
  int id;
  int categoryID;
  String type;
  String title;
  String description;
  String image;
  String city;
  String country;
  ServiceRequest(
      {this.id,
      this.categoryID,
      this.type,
      this.title,
      this.description,
      this.image,
      this.city,
      this.country});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.categoryID != null) {
      data['categoryID'] = this.categoryID;
    }
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    data['image'] = this.image;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}
