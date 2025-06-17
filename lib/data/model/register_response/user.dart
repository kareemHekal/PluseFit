class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
    this.id,
    this.createdAt,
  });

  User.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    activityLevel = json['activityLevel'];
    goal = json['goal'];
    photo = json['photo'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  num? age;
  num? weight;
  num? height;
  String? activityLevel;
  String? goal;
  String? photo;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['age'] = age;
    map['weight'] = weight;
    map['height'] = height;
    map['activityLevel'] = activityLevel;
    map['goal'] = goal;
    map['photo'] = photo;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }
}
