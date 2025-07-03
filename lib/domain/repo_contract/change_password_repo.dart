
import '../../core/api/api_result.dart';

abstract class ChangePasswordRepo {
  Future<ApiResult<bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}