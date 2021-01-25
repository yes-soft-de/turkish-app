class SearchResponse {
  List<Data> data;

  SearchResponse({this.data});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String entity;
  int id;
  String brand;
  String realEstateType;

  Data(
      {this.entity,
        this.id,
        this.brand,
        this.realEstateType,
    });

  Data.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
    id = json['id'];
    brand = json['brand'];
    realEstateType = json['realEstateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity'] = this.entity;
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['realEstateType'] = this.realEstateType;
    return data;
  }
}
