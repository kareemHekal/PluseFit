// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:fit_zone/core/cache/shared_pref.dart';
import 'package:fit_zone/core/constant.dart';
import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:fit_zone/data/model/smart_coach/message_model.dart';
import 'package:fit_zone/domain/use_cases/smart_coach/add_conversation_use_case.dart';
import 'package:fit_zone/domain/use_cases/smart_coach/get_all_conversations_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'smart_coach_intent.dart';

part 'smart_coach_state.dart';

@injectable
class SmartCoachCubit extends Cubit<SmartCoachState> {
  final GetAllConversationsUseCase _getAllConversationsUseCase;
  final AddConversationUseCase _addConversationUseCase;

  SmartCoachCubit(
      this._getAllConversationsUseCase, this._addConversationUseCase)
      : super(SmartCoachInitial());

  /// here is all the messages of the conversation even if it's from the user or the coach
  /// and  to compare between them there is boolean isCoach field
  final List<MessageModel> messages = [];

  /// this attribute get set only if the conversation is loaded from the database
  /// if it's a new conversation it's null
  int? LoadedConversationId;

  static SmartCoachCubit get(BuildContext context) => BlocProvider.of(context);

  void doIntent(SmartCoachIntent intent) {
    switch (intent) {
      case addMessageIntent():
        _addMessage(message: intent.message);
        break;
      case LoadOldConversationIntent():
        _loadOldConversation(conversation: intent.conversation);
        break;
      case AddConversation():
        _addConversation();
        break;
      case GetAllConversations():
        _getAllConversations();
        break;
    }
  }

  /// this one also must be called after call the Ai Model
  _addMessage({required MessageModel message}) {
    messages.add(message);
    if (message.isCoach == false) {
      /// here you must also call the ai model and send him the message by (message.message)
      /// _callAiModel(message.message);
      /// like this
    }
    emit(NewMessageAdded(messages: messages));
  }

  _loadOldConversation({required ConversationModel conversation}) {
    messages.addAll(conversation.messages);
    LoadedConversationId = conversation.id;
    emit(LoadOldConversationState(messages: messages));
  }

  _addConversation() async {
    _addConversationUseCase.addConversation(
        conversation: ConversationModel(
            title: messages.first.message,
            messages: messages,
            id: LoadedConversationId ?? await _getNextId()));
    emit(ConversationAdded());
  }

  _getAllConversations() async {
    var conversations = await _getAllConversationsUseCase.getAllConversations();
    emit(ConversationsLoaded(conversations: conversations));
  }

  Future<int> _getNextId() async {
    int lastId = CacheHelper.getData<int>(Constant.lastConversationIdKey) ?? 0;
    int nextId = lastId + 1;
    await CacheHelper.setData(Constant.lastConversationIdKey, nextId);
    print("✅✅  $nextId");
    return nextId;
  }

  /// you call this when the message is from the user
  /// you call it in the _addMessage function like i mentioned
// _callAiModel(String message) async {
//    here you must call the ai model and send the message
//   await response = ____theCall(message);
//   _addMessage(message: MessageModel(message: response, isCoach: true));
// }
}
