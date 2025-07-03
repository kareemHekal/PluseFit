import 'package:fit_zone/data/data_source_contract/smart_coach_data_source.dart';
import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:fit_zone/domain/repo_contract/smart_coach_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartCoachRepoContract)
class SmartCoachRepoContractImpl implements SmartCoachRepoContract {
  SmartCoachDataSource smartCoachDataSource;

  SmartCoachRepoContractImpl(this.smartCoachDataSource);

  @override
  Future<void> addConversation(
      {required ConversationModel conversation}) async {
    await smartCoachDataSource.addConversation(conversation: conversation);
  }

  @override
  Future<List<ConversationModel>> getAllConversations() async {
    return await smartCoachDataSource.getAllConversations();
  }
}
