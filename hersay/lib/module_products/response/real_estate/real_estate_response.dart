import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';

class RealEstateResponse {
  String statusCode;
  String msg;
  Data data;

  RealEstateResponse({this.statusCode, this.msg, this.data});

  RealEstateResponse.fromJson(Map<String, dynamic> json) {
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
  int id;
  String country;
  String city;
  String space;
  int price;
  String description;
  String status;
  CreatedAt createdAt;
  String image;
  List<Images> images;
  String numberOfFloors;
  String homeFurnishing;
  String realEstateType;
  Reaction reaction;
//  Null documents;
  String username;
  String userImage;
  List<Comment> comments;
  bool editable;
  String title;
  Data({
    this.id,
    this.country,
    this.city,
    this.space,
    this.price,
    this.description,
    this.status,
    this.createdAt,
    this.image,
    this.images,
    this.numberOfFloors,
    this.homeFurnishing,
    this.realEstateType,
    this.reaction,
    this.editable,
//        this.documents,
    this.username,
    this.userImage,
    this.comments,
    this.title,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    editable = json['editable'];
    country = json['country'];
    city = json['city'];
    space = json['space'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    image = json['image'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = new List<Comment>();
      json['comments'].forEach((v) {
        comments.add(new Comment.fromJson(v));
      });
    }
    numberOfFloors = json['numberOfFloors'];
    homeFurnishing = json['homeFurnishing'];
    realEstateType = json['realEstateType'];
    reaction = json['reaction'] != null
        ? new Reaction.fromJson(json['reaction'])
        : null;
//    documents = json['documents'];
    username = json['username'];
    userImage = json['userImage'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['city'] = this.city;
    data['space'] = this.space;
    data['price'] = this.price;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt.toJson();
    }
    data['image'] = this.image;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['numberOfFloors'] = this.numberOfFloors;
    data['homeFurnishing'] = this.homeFurnishing;
    data['realEstateType'] = this.realEstateType;
    if (this.reaction != null) {
      data['reaction'] = this.reaction.toJson();
    }
//    data['documents'] = this.documents;
    data['username'] = this.username;
    data['userImage'] = this.userImage;
    return data;
  }
}

class CreatedAt {
  Timezone timezone;
  int offset;
  int timestamp;

  CreatedAt({this.timezone, this.offset, this.timestamp});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'] != null
        ? new Timezone.fromJson(json['timezone'])
        : null;
    offset = json['offset'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timezone != null) {
      data['timezone'] = this.timezone.toJson();
    }
    data['offset'] = this.offset;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Timezone {
  String name;
  List<Transitions> transitions;
  Location location;

  Timezone({this.name, this.transitions, this.location});

  Timezone.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['transitions'] != null) {
      transitions = new List<Transitions>();
      json['transitions'].forEach((v) {
        transitions.add(new Transitions.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.transitions != null) {
      data['transitions'] = this.transitions.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    return data;
  }
}

class Transitions {
  int ts;
  String time;
  int offset;
  bool isdst;
  String abbr;

  Transitions({this.ts, this.time, this.offset, this.isdst, this.abbr});

  Transitions.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    time = json['time'];
    offset = json['offset'];
    isdst = json['isdst'];
    abbr = json['abbr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['time'] = this.time;
    data['offset'] = this.offset;
    data['isdst'] = this.isdst;
    data['abbr'] = this.abbr;
    return data;
  }
}

class Location {
  String countryCode;
  int latitude;
  int longitude;
  String comments;

  Location({this.countryCode, this.latitude, this.longitude, this.comments});

  Location.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['comments'] = this.comments;
    return data;
  }
}

class Reaction {
  int reactionCount;
  bool createdBy;
  bool isLoved;

  Reaction({this.reactionCount, this.createdBy, this.isLoved});

  Reaction.fromJson(Map<String, dynamic> json) {
    reactionCount = json['reactionCount'];
    createdBy = json['createdBy'];
    isLoved = json['isLoved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reactionCount'] = this.reactionCount;
    data['createdBy'] = this.createdBy;
    data['isLoved'] = this.isLoved;
    return data;
  }
}

class Images {
  String image;
  Null specialLink;

  Images({this.image, this.specialLink});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    specialLink = json['specialLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['specialLink'] = this.specialLink;
    return data;
  }
}
