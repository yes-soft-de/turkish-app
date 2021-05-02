class CategoryResponse {
  List<Data> data;

  CategoryResponse({this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int categoryId;
  String categoryName;
  Data({this.categoryId, this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'];
    categoryName = json['name'];
  }
}
