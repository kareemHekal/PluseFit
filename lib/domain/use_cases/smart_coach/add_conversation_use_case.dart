import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:fit_zone/domain/repo_contract/smart_coach_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddConversationUseCase {
  final SmartCoachRepoContract _smartCoachRepoContract;

  AddConversationUseCase(this._smartCoachRepoContract);

  Future<void> addConversation(
      {required ConversationModel conversation}) async {
    await _smartCoachRepoContract.addConversation(conversation: conversation);
  }
}
