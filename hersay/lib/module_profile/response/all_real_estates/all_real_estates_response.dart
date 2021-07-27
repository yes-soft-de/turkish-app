class AllRealEstatesResponse {
  List<Data> data;

  AllRealEstatesResponse({this.data});

  AllRealEstatesResponse.fromJson(Map<String, dynamic> json) {
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
  String country;
  String city;
  String space;
  int price;
  String description;
  String status;
  CreatedAt createdAt;
  String state;
  String image;
  String numberOfFloors;
  String cladding;
  String homeFurnishing;
  String realEstateType;
  List<Reaction> reaction;
  String rooms;
  String userName;
  String imageUser;
  int commentsCount;
  String title;
  Data(
      {this.id,
      this.country,
      this.city,
      this.space,
      this.price,
      this.description,
      this.status,
      this.createdAt,
      this.state,
      this.image,
      this.numberOfFloors,
      this.cladding,
      this.homeFurnishing,
      this.realEstateType,
      this.reaction,
      this.rooms,
      this.userName,
      this.imageUser,
      this.commentsCount,
      this.title
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    city = json['city'];
    title = json['title'];
    space = json['space'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    state = json['state'];
    image = json['image'];
    numberOfFloors = json['numberOfFloors'];
    cladding = json['cladding'];
    homeFurnishing = json['homeFurnishing'];
    realEstateType = json['realEstateType'];
    if (json['reaction'] != null) {
      reaction = new List<Reaction>();
      json['reaction'].forEach((v) {
        reaction.add(new Reaction.fromJson(v));
      });
    }
    rooms = json['rooms'];
    userName = json['userName'];
    imageUser = json['userImage'];
    commentsCount = json['commentsNumber'];
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
    data['state'] = this.state;
    data['image'] = this.image;
    data['numberOfFloors'] = this.numberOfFloors;
    data['cladding'] = this.cladding;
    data['homeFurnishing'] = this.homeFurnishing;
    data['realEstateType'] = this.realEstateType;
    if (this.reaction != null) {
      data['reaction'] = this.reaction.map((v) => v.toJson()).toList();
    }
    data['rooms'] = this.rooms;
    data['userName'] = this.userName;
    data['userImage'] = this.imageUser;
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
