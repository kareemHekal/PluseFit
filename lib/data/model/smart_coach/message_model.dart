import 'package:hive/hive.dart';

part 'generated/message_model.g.dart';

@HiveType(typeId: 1)
class MessageModel {
  @HiveField(0)
  final String message;

  @HiveField(1)
  final bool isCoach;

  MessageModel({
    required this.message,
    required this.isCoach,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      isCoach: json['isCoach'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'isCoach': isCoach,
    };
  }
}
