class CarResponse {
  String statusCode;
  String msg;
  Data data;

  CarResponse({this.statusCode, this.msg, this.data});

  CarResponse.fromJson(Map<String, dynamic> json) {
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
  String brand;
  String company;
  YearOfRelease yearOfRelease;
  String engine;
  int price;
  String description;
  String status;
  String createdBy;
  YearOfRelease createdAt;
  YearOfRelease updateAt;
  String distance;
  String carType;
  String gearType;
  String cc;
  String fuel;
  String country;
  String city;
  String image;
  List<String> images;
  Reaction reaction;
  Null state;
  String username;
  String userImage;

  Data(
      {this.id,
        this.brand,
        this.company,
        this.yearOfRelease,
        this.engine,
        this.price,
        this.description,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updateAt,
        this.distance,
        this.carType,
        this.gearType,
        this.cc,
        this.fuel,
        this.country,
        this.city,
        this.image,
        this.images,
        this.reaction,
        this.state,
        this.username,
        this.userImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    company = json['company'];
    yearOfRelease = json['yearOfRelease'] != null
        ? new YearOfRelease.fromJson(json['yearOfRelease'])
        : null;
    engine = json['engine'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'] != null
        ? new YearOfRelease.fromJson(json['createdAt'])
        : null;
    updateAt = json['updateAt'] != null
        ? new YearOfRelease.fromJson(json['updateAt'])
        : null;
    distance = json['distance'];
    carType = json['carType'];
    gearType = json['gearType'];
    cc = json['cc'];
    fuel = json['fuel'];
    country = json['country'];
    city = json['city'];
    image = json['image'];
    images = json['images'].cast<String>();
    reaction = json['reaction'] != null
        ? new Reaction.fromJson(json['reaction'])
        : null;
    state = json['state'];
    username = json['username'];
    userImage = json['userImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['company'] = this.company;
    if (this.yearOfRelease != null) {
      data['yearOfRelease'] = this.yearOfRelease.toJson();
    }
    data['engine'] = this.engine;
    data['price'] = this.price;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt.toJson();
    }
    if (this.updateAt != null) {
      data['updateAt'] = this.updateAt.toJson();
    }
    data['distance'] = this.distance;
    data['carType'] = this.carType;
    data['gearType'] = this.gearType;
    data['cc'] = this.cc;
    data['fuel'] = this.fuel;
    data['country'] = this.country;
    data['city'] = this.city;
    data['image'] = this.image;
    data['images'] = this.images;
    if (this.reaction != null) {
      data['reaction'] = this.reaction.toJson();
    }
    data['state'] = this.state;
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
