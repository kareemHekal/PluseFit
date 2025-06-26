import 'muscles_group.dart';

/// message : "success"
/// musclesGroup : [{"_id":"67c79f3526895f87ce0aa96b","name":"Abdominals"},{"_id":"67c79f3526895f87ce0aa96c","name":"Glutes"},{"_id":"67c79f3526895f87ce0aa96d","name":"Chest"},{"_id":"67c79f3526895f87ce0aa96e","name":"Shoulders"},{"_id":"67c79f3526895f87ce0aa96f","name":"Back"},{"_id":"67c79f3526895f87ce0aa970","name":"Adductors"},{"_id":"67c79f3526895f87ce0aa971","name":"Biceps"},{"_id":"67c79f3526895f87ce0aa972","name":"Quadriceps"},{"_id":"67c79f3526895f87ce0aa973","name":"Hamstrings"},{"_id":"67c79f3526895f87ce0aa974","name":"Abductors"},{"_id":"67c79f3526895f87ce0aa975","name":"Trapezius"},{"_id":"67c79f3526895f87ce0aa976","name":"Triceps"},{"_id":"67c79f3526895f87ce0aa977","name":"Forearms"},{"_id":"67c79f3526895f87ce0aa978","name":"Calves"},{"_id":"67c79f3526895f87ce0aa979","name":"Shins"},{"_id":"67c79f3526895f87ce0aa97a","name":"Hip Flexors"},{"_id":"67c79f3526895f87ce0aa97b","name":"Trapezius"}]

class WorkoutGroupResponse {
  String? message;
  List<MusclesGroup>? musclesGroup;

  WorkoutGroupResponse({this.message, this.musclesGroup});

  WorkoutGroupResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['musclesGroup'] != null) {
      musclesGroup = [];
      json['musclesGroup'].forEach((v) {
        musclesGroup?.add(MusclesGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (musclesGroup != null) {
      map['musclesGroup'] = musclesGroup?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
