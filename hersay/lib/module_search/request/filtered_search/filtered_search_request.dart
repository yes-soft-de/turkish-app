class FilteredSearchRequest {
  String entity;
  String city;
  String lowestPrice;
  String highestPrice;
  int categoryID;

  FilteredSearchRequest(
      {this.entity, this.city, this.lowestPrice, this.highestPrice,this.categoryID});

  FilteredSearchRequest.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
    city = json['city'];
    lowestPrice = json['price'];
    highestPrice = json['price_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entity != null) {
      data['entity'] = this.entity;
    }
    if (this.city != null) {
      data['city'] = this.city;
    }
    if (this.lowestPrice != null) {
      data['price'] = this.lowestPrice;
    }
    if (this.highestPrice != null) {
      data['price_2'] = this.highestPrice;
    }
    if (this.categoryID != null) {
      data['categoryID'] = this.categoryID;
    }
    return data;
  }
}
