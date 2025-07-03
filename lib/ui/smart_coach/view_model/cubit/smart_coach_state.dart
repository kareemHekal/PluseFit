part of 'smart_coach_cubit.dart';

sealed class SmartCoachState {}

final class SmartCoachInitial extends SmartCoachState {}

final class NewMessageAdded extends SmartCoachState {
  List<MessageModel> messages;

  NewMessageAdded({required this.messages});
}

final class LoadOldConversationState extends SmartCoachState {
  List<MessageModel> messages;

  LoadOldConversationState({required this.messages});
}

final class ConversationAdded extends SmartCoachState {}

final class ConversationsLoaded extends SmartCoachState {
  List<ConversationModel> conversations;

  ConversationsLoaded({required this.conversations});
}
