class MessageModel {
  final String message;
  final bool isCoach;

  MessageModel({
    required this.message,
    required this.isCoach,
  });

  // Factory constructor to create from JSON
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'] as String,
      isCoach: json['isCoach'] as bool,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'isCoach': isCoach,
    };
  }
}
