import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box<ConversationModel>> get conversationBox =>
      Hive.openBox<ConversationModel>('conversations');
}
