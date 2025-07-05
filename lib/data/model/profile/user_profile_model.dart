class UserProfileModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  int? age;
  int? weight;
  int? height;
  String? activityLevel;
  String? goal;
  String? photo;
  String? createdAt;

  UserProfileModel({
    this.id,
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
    this.createdAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json['_id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        gender: json['gender'],
        age: json['age'],
        weight: json['weight'],
        height: json['height'],
        activityLevel: json['activityLevel'],
        goal: json['goal'],
        photo: json['photo'],
        createdAt: json['createdAt'],
      );
}
