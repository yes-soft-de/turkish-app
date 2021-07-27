class ReactionRequest {
  int type;
  int itemID;
  String entity;

  ReactionRequest({this.type, this.itemID, this.entity});
 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['itemID'] = this.itemID;
    data['entity'] = this.entity;
    return data;
  }
}
