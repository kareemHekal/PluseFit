import 'levels.dart';

class GetAllLevelResponse {
  GetAllLevelResponse({
      this.message, 
      this.levels,});

  GetAllLevelResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['levels'] != null) {
      levels = [];
      json['levels'].forEach((v) {
        levels?.add(Levels.fromJson(v));
      });
    }
  }
  String? message;
  List<Levels>? levels;
GetAllLevelResponse copyWith({  String? message,
  List<Levels>? levels,
}) => GetAllLevelResponse(  message: message ?? this.message,
  levels: levels ?? this.levels,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (levels != null) {
      map['levels'] = levels?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}