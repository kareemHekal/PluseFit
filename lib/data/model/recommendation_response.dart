import 'package:fit_zone/domain/entity/recommendation_entity.dart';

class RecommendationResponse {
  String? message;
  int? totalMuscles;
  List<MuscleModel>? muscles;

  RecommendationResponse({this.message, this.totalMuscles, this.muscles});

  RecommendationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    totalMuscles = json['totalMuscles'];
    if (json['muscles'] != null) {
      muscles = <MuscleModel>[];
      json['muscles'].forEach((v) {
        muscles!.add(MuscleModel.fromJson(v));
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

class MuscleModel {
  String? sId;
  String? name;
  String? image;

  MuscleModel({this.sId, this.name, this.image});

  MuscleModel.fromJson(Map<String, dynamic> json) {
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

  MuscleEntity toEntity() {
    return MuscleEntity(
      id: sId,
      name: name,
      image: image,
    );
  }
}
