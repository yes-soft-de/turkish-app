class ServiceRequest {
  int id;
  String type;
  String title;
  String description;
  String image;
  ServiceRequest({
    this.id,
    this.type,
    this.title,
    this.description,
    this.image,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
