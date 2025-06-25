class MusclesGroupResponse {
  String? message;
  List<MusclesGroupModel>? musclesGroup;

  MusclesGroupResponse({this.message, this.musclesGroup});

  MusclesGroupResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['musclesGroup'] != null) {
      musclesGroup = <MusclesGroupModel>[];
      json['musclesGroup'].forEach((v) {
        musclesGroup!.add(MusclesGroupModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (musclesGroup != null) {
      data['musclesGroup'] = musclesGroup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusclesGroupModel {
  String? sId;
  String? name;

  MusclesGroupModel({this.sId, this.name});

  MusclesGroupModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
