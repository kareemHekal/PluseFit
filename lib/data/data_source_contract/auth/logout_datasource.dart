import 'package:fit_zone/core/api/api_result.dart';

abstract class LogoutDatasource {
  Future<ApiResult<bool>> logout();
}