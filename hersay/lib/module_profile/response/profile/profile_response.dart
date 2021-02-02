import 'package:hersay/module_profile/response/all_cars/all_cars_response.dart';
import 'package:hersay/module_profile/response/all_devices/all_devices_response.dart';
import 'package:hersay/module_profile/response/all_real_estates/all_real_estates_response.dart';

class ProfileResponse {
  String statusCode;
  String msg;
  Data data;
  AllDevicesResponse  electronicDevices;
  AllCarsResponse cars;
  AllRealEstatesResponse realEstates;

  ProfileResponse({
    this.statusCode,
    this.msg,
    this.data,
    this.electronicDevices,
    this.cars,
    this.realEstates,
  });

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
  String country;
  String city;

  Data({this.userName, this.location, this.story, this.image,this.city, this.country,});

  Data.fromJson(Map<String, dynamic> json) {
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
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}
