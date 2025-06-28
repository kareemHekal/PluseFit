import 'package:fit_zone/data/model/smart_coach/message_model.dart';

class ConversationModel {
  final String title;
  final List<MessageModel> messages;

  ConversationModel({
    required this.title,
    required this.messages,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      title: json['title'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((msg) => MessageModel.fromJson(msg))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'messages': messages.map((msg) => msg.toJson()).toList(),
    };
  }
}
