/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NTQ0NWIyZGI2NTIwMDUxNDQxNjVmYSIsImlhdCI6MTc1MDQyMTkxNX0.rSKIAwMM4wXygGJm_a1Vk2Ka0xqBaT_RBmyWkpeaczA"

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