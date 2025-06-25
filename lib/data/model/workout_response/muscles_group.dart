/// _id : "67c79f3526895f87ce0aa96b"
/// name : "Abdominals"

class MusclesGroup {
  String? id;
  String? name;

  MusclesGroup({this.name, this.id});

  MusclesGroup.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    return map;
  }
}
