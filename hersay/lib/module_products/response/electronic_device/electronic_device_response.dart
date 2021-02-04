class ElectronicDeviceResponse {
  String statusCode;
  String msg;
  Data data;

  ElectronicDeviceResponse({this.statusCode, this.msg, this.data});

  ElectronicDeviceResponse.fromJson(Map<String, dynamic> json) {
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
  String type;
  String brand;
  String cpu;
  String ram;
  String battery;
  int price;
  YearOfRelease yearOfRelease;
  String description;
  String status;
  String createdBy;
  YearOfRelease createdAt;
  String gauge;
  String country;
  String city;
  String durationOfUse;
  String image;
  List<String> images;
  Reaction reaction;
  String username;
  String userImage;

  Data(
      {this.type,
        this.brand,
        this.cpu,
        this.ram,
        this.battery,
        this.price,
        this.yearOfRelease,
        this.description,
        this.status,
        this.createdBy,
        this.createdAt,
        this.gauge,
        this.country,
        this.city,
        this.durationOfUse,
        this.image,
        this.images,
        this.reaction,
        this.username,
        this.userImage});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    brand = json['brand'];
    cpu = json['cpu'];
    ram = json['ram'];
    battery = json['battery'];
    price = json['price'];
    yearOfRelease = json['yearOfRelease'] != null
        ? new YearOfRelease.fromJson(json['yearOfRelease'])
        : null;
    description = json['description'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'] != null
        ? new YearOfRelease.fromJson(json['createdAt'])
        : null;
    gauge = json['gauge'];
    country = json['country'];
    city = json['city'];
    durationOfUse = json['durationOfUse'];
    image = json['image'];
    images = json['images'].cast<String>();
    reaction = json['reaction'] != null
        ? new Reaction.fromJson(json['reaction'])
        : null;

    username = json['username'];
    userImage = json['userImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['brand'] = this.brand;
    data['cpu'] = this.cpu;
    data['ram'] = this.ram;
    data['battery'] = this.battery;
    data['price'] = this.price;
    if (this.yearOfRelease != null) {
      data['yearOfRelease'] = this.yearOfRelease.toJson();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt.toJson();
    }
    data['gauge'] = this.gauge;
    data['country'] = this.country;
    data['city'] = this.city;
    data['durationOfUse'] = this.durationOfUse;
    data['image'] = this.image;
    data['images'] = this.images;
    if (this.reaction != null) {
      data['reaction'] = this.reaction.toJson();
    }

    data['username'] = this.username;
    data['userImage'] = this.userImage;
    return data;
  }
}

class YearOfRelease {
  Timezone timezone;
  int offset;
  int timestamp;

  YearOfRelease({this.timezone, this.offset, this.timestamp});

  YearOfRelease.fromJson(Map<String, dynamic> json) {
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
