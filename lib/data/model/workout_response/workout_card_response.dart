import 'muscles.dart';

/// message : "success"
/// totalMuscles : 2
/// muscles : [{"_id":"67c8499726895f87ce0aa9bc","name":"Rectus Abdominis","image":"https://iili.io/33pYHNI.png"},{"_id":"67c8499726895f87ce0aa9bd","name":"Obliques","image":"https://iili.io/33p7mSR.png"}]

class WorkoutCardResponse {
  String? message;
  num? totalMuscles;
  List<Muscles>? muscles;

  WorkoutCardResponse({this.message, this.muscles, this.totalMuscles});

  WorkoutCardResponse.fromJson(dynamic json) {
    message = json['message'];
    totalMuscles = json['totalMuscles'];
    if (json['muscles'] != null) {
      muscles = [];
      json['muscles'].forEach((v) {
        muscles!.add(Muscles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['totalMuscles'] = totalMuscles;
    if (muscles != null) {
      map['muscles'] = muscles!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
