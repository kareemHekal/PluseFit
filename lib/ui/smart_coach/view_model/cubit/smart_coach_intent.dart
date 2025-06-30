// ignore_for_file: camel_case_types

import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:fit_zone/data/model/smart_coach/message_model.dart';

///  Auth Intent ///
// ignore_for_file: non_constant_identifier_names, dangling_library_doc_comments

sealed class SmartCoachIntent {}

class addMessageIntent extends SmartCoachIntent {
  final MessageModel message;

  addMessageIntent({required this.message});
}

class LoadOldConversationIntent extends SmartCoachIntent {
  final ConversationModel conversation;

  LoadOldConversationIntent({required this.conversation});
}

class AddConversation extends SmartCoachIntent {}

class GetAllConversations extends SmartCoachIntent {}
