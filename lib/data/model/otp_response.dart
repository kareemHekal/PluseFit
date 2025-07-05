class OtpResponse {
  OtpResponse({
    this.status,
  });

  OtpResponse.fromJson(dynamic json) {
    status = json['status'];
  }

  String? status;

  OtpResponse copyWith({
    String? status,
  }) =>
      OtpResponse(
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
