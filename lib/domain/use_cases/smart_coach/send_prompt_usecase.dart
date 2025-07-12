import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/firebase/datasource/send_a_prompt_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendPromptUsecase {
  final SendAPromptDatasource _sendAPromptDatasource;
  @factoryMethod
  SendPromptUsecase(this._sendAPromptDatasource);
  Future<ApiResult<String?>> sendPrompt(String prompt) async =>
      await _sendAPromptDatasource.sendAPromptRequest(prompt);
}
