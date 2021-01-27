class ProfileResponse {
  String statusCode;
  String msg;
  Data data;

  ProfileResponse({this.statusCode, this.msg, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userName;
  String location;
  String story;
  String image;

  Data({this.userName, this.location, this.story, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    location = json['location'];
    story = json['story'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['location'] = this.location;
    data['story'] = this.story;
    data['image'] = this.image;
    return data;
  }
}
