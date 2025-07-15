import 'package:fit_zone/core/api/api_result.dart';

abstract class LogoutRepo {
  Future<ApiResult<bool>> logout();
}