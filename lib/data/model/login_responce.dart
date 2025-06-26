import 'package:fit_zone/data/model/register_response/user_model.dart';

/// message : "success"
/// user : {"_id":"684c5804db65200514414957","firstName":"kareem","lastName":"hekal","email":"kareemhekal19@gmail.com","gender":"male","age":18,"weight":70,"height":170,"activityLevel":"level1","goal":"Gain weight","photo":"https://fitness.elevateegy.com/uploads/default-profile.png","createdAt":"2025-06-13T16:55:32.042Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjg0YzU4MDRkYjY1MjAwNTE0NDE0OTU3IiwiaWF0IjoxNzUwOTA0MDMyfQ.8dr1jJa24mE_WUXdKyBOHRu03lmr5jQFgkYvhfBMHPE"

class LoginResponse {
  LoginResponse({
    this.message,
    this.user,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserModel? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// _id : "684c5804db65200514414957"
/// firstName : "kareem"
/// lastName : "hekal"
/// email : "kareemhekal19@gmail.com"
/// gender : "male"
/// age : 18
/// weight : 70
/// height : 170
/// activityLevel : "level1"
/// goal : "Gain weight"
/// photo : "https://fitness.elevateegy.com/uploads/default-profile.png"
/// createdAt : "2025-06-13T16:55:32.042Z"
