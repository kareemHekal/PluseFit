import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../repo_contract/change_password_repo.dart';

@injectable
class ChangePasswordUsecase {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordUsecase(this.changePasswordRepo);

  Future<ApiResult<bool>> call({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await changePasswordRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}