import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/firebase/datasource/send_a_prompt_datasource.dart';
import 'package:fit_zone/firebase/services/gemini_services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SendAPromptDatasource)
class SendAPromptDatasourceImpl implements SendAPromptDatasource {
  final GeminiServices _geminiServices;
  @factoryMethod
  SendAPromptDatasourceImpl(this._geminiServices);
  @override
  Future<ApiResult<String?>> sendAPromptRequest(String prompt) async {
    try {
      final result = await _geminiServices.sendAPromptRequest(prompt);
      return SuccessApiResult(result);
    } catch (e) {
      return ErrorApiResult(Exception(e.toString()));
    }
  }
}
