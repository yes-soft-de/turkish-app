class NotificationResponse {
  Data data;

  NotificationResponse({this.data});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = Data.fromJson(json['Data']);
    }
  }
}

class Data {
  List<Comments> comments;
  List<Chats> chats;
  List<Reactions> reactions;
  Data({this.chats, this.comments, this.reactions});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats.add(Chats.fromJson(v));
      });
    }
    if (json['reactions'] != null) {
      reactions = <Reactions>[];
      json['reactions'].forEach((v) {
        reactions.add(Reactions.fromJson(v));
      });
    }
  }
}

class Comments {
  int id;
  String userName;
  String image;
  String entity;
  int itemID;
  String comment;
  CreatedAt createdAt;
  String entityName;
  Comments({
    this.id,
    this.userName,
    this.comment,
    this.createdAt,
    this.entity,
    this.entityName,
    this.image,
    this.itemID,
  });
  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    comment = json['comment'];
    entity = json['entity'];
    entityName = json['entityName'];
    image = json['image'];
    itemID = json['itemID'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
  }
}

class Chats {
  int id;
  String roomID;
  String username;
  String image;
  CreatedAt startAt;

  Chats.fromJson(Map<String, dynamic> json) {
    roomID = json['roomID'];
    username = json['username'];
    image = json['image'];
    startAt = json['startAt'] != null
        ? new CreatedAt.fromJson(json['startAt'])
        : null;
    // username = json['username'];
    // entityName = json['entityName'];
  }
}

class Reactions {
  String username;
  String image;
  String entityName;
  CreatedAt createdAt;
  String userImage;
  Reactions(
      {this.image,
      this.entityName,
      this.userImage,
      this.createdAt,
      this.username});
  Reactions.fromJson(Map<String, dynamic> json) {
    userImage = json['userImage'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    username = json['username'];
    entityName = json['entityName'];
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
