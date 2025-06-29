import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:fit_zone/domain/repo_contract/smart_coach_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllConversationsUseCase {
  final SmartCoachRepoContract _smartCoachRepoContract;

  GetAllConversationsUseCase(this._smartCoachRepoContract);

  Future<List<ConversationModel>> getAllConversations() async {
    return await _smartCoachRepoContract.getAllConversations();
  }
}
