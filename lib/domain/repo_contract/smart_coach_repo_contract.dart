import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';

abstract class SmartCoachRepoContract {
  Future<List<ConversationModel>> getAllConversations();

  Future<void> addConversation({required ConversationModel conversation});
}
