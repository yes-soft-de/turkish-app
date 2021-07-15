class ReportRequest {
  var itemID;
  var entity;
  var reason;

  ReportRequest({
    this.entity,
    this.itemID,
    this.reason,
});

  Map<String, dynamic> toJson() {
    return {
      'itemID': itemID,
      'entity': entity,
      'reason': reason,
    };
  }
}