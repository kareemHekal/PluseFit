import 'muscle_group.dart';
import 'muscles.dart';

/// message : "success"
/// muscleGroup : {"_id":"67c79f3526895f87ce0aa96d","name":"عضلات الصدر"}
/// muscles : [{"_id":"67c8499726895f87ce0aa9be","name":"العضلة الصدرية الكبرى","image":"https://iili.io/33p7y9p.png"}]

class MuscleResponse {
  MuscleResponse({
      this.message, 
      this.muscleGroup, 
      this.muscles,});

  MuscleResponse.fromJson(dynamic json) {
    message = json['message'];
    muscleGroup = json['muscleGroup'] != null ? MuscleGroup.fromJson(json['muscleGroup']) : null;
    if (json['muscles'] != null) {
      muscles = [];
      json['muscles'].forEach((v) {
        muscles?.add(Muscles.fromJson(v));
      });
    }
  }
  String? message;
  MuscleGroup? muscleGroup;
  List<Muscles>? muscles;
MuscleResponse copyWith({  String? message,
  MuscleGroup? muscleGroup,
  List<Muscles>? muscles,
}) => MuscleResponse(  message: message ?? this.message,
  muscleGroup: muscleGroup ?? this.muscleGroup,
  muscles: muscles ?? this.muscles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (muscleGroup != null) {
      map['muscleGroup'] = muscleGroup?.toJson();
    }
    if (muscles != null) {
      map['muscles'] = muscles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}