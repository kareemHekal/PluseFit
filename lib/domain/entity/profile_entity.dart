import 'package:fit_zone/data/model/profile/user_profile_model.dart';

class ProfileEntity {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final int? age;
  int? weight;
  final int? height;
  String? activityLevel;
  String? goal;
  String? photo;
  final String? createdAt;

  ProfileEntity({
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

  factory ProfileEntity.fromModel(UserProfileModel model) => ProfileEntity(
        id: model.id,
        firstName: model.firstName,
        lastName: model.lastName,
        email: model.email,
        gender: model.gender,
        age: model.age,
        weight: model.weight,
        height: model.height,
        activityLevel: model.activityLevel,
        goal: model.goal,
        photo: model.photo,
        createdAt: model.createdAt,
      );
}
