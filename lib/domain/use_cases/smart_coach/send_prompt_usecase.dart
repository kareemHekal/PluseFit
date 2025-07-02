import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/firebase/datasource/send_a_prompt_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendPromptUsecase {
  SendAPromptDatasource sendAPromptDatasource;
  @factoryMethod
  SendPromptUsecase(this.sendAPromptDatasource);
  Future<ApiResult<String?>> sendPrompt(String prompt) async =>
      await sendAPromptDatasource.sendAPromptRequest(prompt);
}
