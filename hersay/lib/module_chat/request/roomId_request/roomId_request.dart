class RoomIdRequest {
  String entity;
  String itemID;
  int lawyer;

  RoomIdRequest({this.entity, this.itemID,this.lawyer});

  RoomIdRequest.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
    itemID = json['itemID'];
    lawyer = json['lawyer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity'] = this.entity;
    data['itemID'] = this.itemID;
    data['lawyer'] = this.lawyer;
    return data;
  }
}
