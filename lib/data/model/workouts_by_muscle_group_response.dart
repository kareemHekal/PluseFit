import 'package:fit_zone/domain/entity/workouts_entity.dart';

class WorkoutsByMuscleGroupResponse {
  String? message;
  int? totalMuscles;
  List<WorkoutModel>? muscles;

  WorkoutsByMuscleGroupResponse(
      {this.message, this.totalMuscles, this.muscles});

  WorkoutsByMuscleGroupResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    totalMuscles = json['totalMuscles'];
    if (json['muscles'] != null) {
      muscles = <WorkoutModel>[];
      json['muscles'].forEach((v) {
        muscles!.add(WorkoutModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['totalMuscles'] = totalMuscles;
    if (muscles != null) {
      data['muscles'] = muscles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkoutModel {
  String? sId;
  String? name;
  String? image;

  WorkoutModel({this.sId, this.name, this.image});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }

  WorkoutEntity toEntity() {
    return WorkoutEntity(
      id: sId,
      name: name,
      image: image,
    );
  }
}
