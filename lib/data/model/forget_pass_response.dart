/// message : "success"
/// info : "OTP sent to your email"

class ForgetPasswordResponse {
  ForgetPasswordResponse({
      this.message, 
      this.info,});

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
  }
  String? message;
  String? info;
ForgetPasswordResponse copyWith({  String? message,
  String? info,
}) => ForgetPasswordResponse(  message: message ?? this.message,
  info: info ?? this.info,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    return map;
  }

}