class FilteredSearchRequest {
  String entity;
  String city;
  int lowestPrice;
  int highestPrice;

  FilteredSearchRequest({this.entity, this.city, this.lowestPrice,this.highestPrice});

  FilteredSearchRequest.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
    city = json['city'];
    lowestPrice = json['price'];
    highestPrice = json['price_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity'] = this.entity;
    data['city'] = this.city;
    data['price'] = this.lowestPrice;
    data['price_2'] = this.highestPrice;
    return data;
  }
}
