
import '../../core/api/api_result.dart';

abstract class ChangePasswordDatasource {
  Future<ApiResult<bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}