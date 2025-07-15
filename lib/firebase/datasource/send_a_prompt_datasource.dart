import 'package:fit_zone/core/api/api_result.dart';

abstract class SendAPromptDatasource {
  Future<ApiResult<String?>> sendAPromptRequest(String prompt);
}
