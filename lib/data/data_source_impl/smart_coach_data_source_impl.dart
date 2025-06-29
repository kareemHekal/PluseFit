import 'package:fit_zone/data/data_source_contract/smart_coach_data_source.dart';
import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartCoachDataSource)
class SmartCoachDataSourceImpl implements SmartCoachDataSource {
  final Box<ConversationModel> box;

  SmartCoachDataSourceImpl(this.box);

  @override
  Future<void> addConversation(
      {required ConversationModel conversation}) async {
    await box.put(conversation.id, conversation);
  }

  @override
  Future<List<ConversationModel>> getAllConversations() async {
    return box.values.toList();
  }
}
