class RoomIdRequest {
  String entity;
  String itemID;

  RoomIdRequest({this.entity, this.itemID});

  RoomIdRequest.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
    itemID = json['itemID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity'] = this.entity;
    data['itemID'] = this.itemID;
    return data;
  }
}
