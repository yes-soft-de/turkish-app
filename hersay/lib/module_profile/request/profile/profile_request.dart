class ProfileRequest {
  String userName;
  String country;
  String city;
  String location;
  String story;
  String image;

  ProfileRequest({this.userName, this.location, this.story, this.image,this.city,this.country});

  ProfileRequest.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    location = json['location'];
    story = json['story'];
    image = json['image'];
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['location'] = this.location;
    data['story'] = this.story;
    data['image'] = this.image;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}