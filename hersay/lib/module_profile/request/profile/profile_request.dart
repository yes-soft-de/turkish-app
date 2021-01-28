class ProfileRequest {
  String userName;
  String location;
  String story;
  String image;

  ProfileRequest({this.userName, this.location, this.story, this.image});

  ProfileRequest.fromJson(Map<String, dynamic> json) {
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