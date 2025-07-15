 
class Muscles {
  Muscles({
      this.id, 
      this.name, 
      this.image,});

  Muscles.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? image;
Muscles copyWith({  String? id,
  String? name,
  String? image,
}) => Muscles(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}