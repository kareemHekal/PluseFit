
class ResetPasswordResponse {
  ResetPasswordResponse({
      this.message, 
      this.token,});

  ResetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;
ResetPasswordResponse copyWith({  String? message,
  String? token,
}) => ResetPasswordResponse(  message: message ?? this.message,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}