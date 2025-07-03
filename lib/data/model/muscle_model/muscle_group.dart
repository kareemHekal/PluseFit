
class MuscleGroup {
  MuscleGroup({
      this.id, 
      this.name,});

  MuscleGroup.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
  }
  String? id;
  String? name;
MuscleGroup copyWith({  String? id,
  String? name,
}) => MuscleGroup(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    return map;
  }

}