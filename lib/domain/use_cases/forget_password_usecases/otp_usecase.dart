
import 'package:fit_zone/domain/repo_contract/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data/model/otp_response.dart';

@injectable
class OtpUsecase{
  ForgetPasswordRepo forgetPasswordRepo;
  OtpUsecase(this.forgetPasswordRepo);

  Future<ApiResult<OtpResponse>> call({required String resetCode,}) async{
   return await forgetPasswordRepo.verifyResetCode(resetCode: resetCode);
  }
}