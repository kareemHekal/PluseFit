
import 'package:fit_zone/domain/repo_contract/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data/model/reset_password_response.dart';

@injectable
class ResetPasswordUsecase{
  ForgetPasswordRepo forgetPasswordRepo;
  ResetPasswordUsecase(this.forgetPasswordRepo);
 Future<ApiResult<ResetPasswordResponse>> call({required String email, required String newPassword}){
    return forgetPasswordRepo.resetPassword(email: email, newPassword: newPassword);
  }
}