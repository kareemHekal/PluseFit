import 'package:fit_zone/domain/repo_contract/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data/model/forget_pass_response.dart';

@injectable
class ForgetPasswordUseCase{

  ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordUseCase(this.forgetPasswordRepo);
  Future<ApiResult<ForgetPasswordResponse>> call({required String email})async{
    return await forgetPasswordRepo.ForgetPassword(email: email);
  }
}