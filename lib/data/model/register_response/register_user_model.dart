import 'package:fit_zone/domain/entity/gender_enum.dart';

class RegisterUserModel {
  RegisterUserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.goal,
    this.activityLevel,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  Gender? gender;
  num? height;
  num? weight;
  num? age;
  String? goal;
  String? activityLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = password;
    map['gender'] = gender == Gender.male
        ? 'male'
        : gender == Gender.female
            ? 'female'
            : null;
    map['height'] = height;
    map['weight'] = weight;
    map['age'] = age;
    map['goal'] = goal;
    map['activityLevel'] = activityLevel;
    return map;
  }
}
