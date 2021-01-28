class FilteredSearchRequest {
  String entity;
  String city;
  int price;

  FilteredSearchRequest({this.entity, this.city, this.price});

  FilteredSearchRequest.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
    city = json['city'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity'] = this.entity;
    data['city'] = this.city;
    data['price'] = this.price;
    return data;
  }
}
