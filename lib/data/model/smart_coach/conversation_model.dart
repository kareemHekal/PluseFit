import 'package:hive/hive.dart';

import 'message_model.dart';

part 'generated/conversation_model.g.dart';

@HiveType(typeId: 2)
class ConversationModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<MessageModel> messages;

  @HiveField(2)
  final int id;

  ConversationModel({
    required this.title,
    required this.messages,
    required this.id,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['_id'],
      title: json['title'],
      messages: (json['messages'] as List<dynamic>)
          .map((msg) => MessageModel.fromJson(msg))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'messages': messages.map((msg) => msg.toJson()).toList(),
    };
  }
}
