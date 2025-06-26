// _id : "67c8499726895f87ce0aa9bc"
// name : "Rectus Abdominis"
// image : "https://iili.io/33pYHNI.png"

class Muscles {
  String? id;
  String? name;
  String? image;

  Muscles({this.id, this.name, this.image});

  Muscles.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
