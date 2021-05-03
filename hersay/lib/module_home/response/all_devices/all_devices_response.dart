class AllDevicesResponse {
  List<Data> data;

  AllDevicesResponse({this.data});

  AllDevicesResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String type;
  String brand;
  String cpu;
  String ram;
  String battery;
  int price;
  YearOfRelease yearOfRelease;
  String description;
  String status;
  YearOfRelease createdAt;
  String gauge;
  String country;
  String city;
  String durationOfUse;
  String image;
  List<Reaction> reaction;
  String userName;
  String imageUser;
  int commentsCount;
  String title;
  Data(
      {this.id,
      this.type,
      this.brand,
      this.cpu,
      this.ram,
      this.battery,
      this.price,
      this.yearOfRelease,
      this.description,
      this.status,
      this.createdAt,
      this.gauge,
      this.country,
      this.city,
      this.durationOfUse,
      this.image,
      this.reaction,
      this.userName,
      this.imageUser,
      this.commentsCount,
      this.title});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    brand = json['brand'];
    cpu = json['cpu'];
    ram = json['ram'];
    battery = json['battery'];
    price = json['price'];
    commentsCount = json['commentsNumber'];
    yearOfRelease = json['yearOfRelease'] != null
        ? new YearOfRelease.fromJson(json['yearOfRelease'])
        : null;
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'] != null
        ? new YearOfRelease.fromJson(json['createdAt'])
        : null;
    gauge = json['gauge'];
    country = json['country'];
    city = json['city'];
    durationOfUse = json['durationOfUse'];
    image = json['image'];
    if (json['reaction'] != null) {
      reaction = new List<Reaction>();
      json['reaction'].forEach((v) {
        reaction.add(new Reaction.fromJson(v));
      });
    }
    userName = json['userName'];
    imageUser = json['userImage'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt.toJson();
    }
    data['gauge'] = this.gauge;
    data['country'] = this.country;
    data['city'] = this.city;
    data['durationOfUse'] = this.durationOfUse;
    data['image'] = this.image;
    if (this.reaction != null) {
      data['reaction'] = this.reaction.map((v) => v.toJson()).toList();
    }
    data['userName'] = this.userName;
    data['userImage'] = this.imageUser;
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

  Reaction({this.reactionCount, this.createdBy});

  Reaction.fromJson(Map<String, dynamic> json) {
    reactionCount = json['reactionCount'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reactionCount'] = this.reactionCount;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
