class CommentRequest {
  int itemId;
  String entity;
  String comment;
  
  CommentRequest(
     this.itemId,
     this.entity,
     this.comment,
  );
  
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemId;
    data['entity'] = this.entity;
    data['comment'] = this.comment;
    return data;
  }

}
