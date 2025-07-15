import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/auth/forget_password_datasource.dart';
import 'package:fit_zone/data/model/forget_pass_response.dart';
import 'package:fit_zone/data/model/otp_response.dart';
import 'package:fit_zone/data/model/reset_password_response.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repo_contract/forget_password_repo.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  final ForgetPasswordDatasource forgetPasswordDatasource;

  ForgetPasswordRepoImpl(this.forgetPasswordDatasource);

  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword({
    required String email,
  }) async {
    return await forgetPasswordDatasource.forgetPassword(email: email);
  }

  @override
  Future<ApiResult<OtpResponse>> verifyResetCode({required String resetCode}) async{
    return await forgetPasswordDatasource.verifyResetCode(resetCode: resetCode);
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword({required String email, required String newPassword})async {
    return await forgetPasswordDatasource.resetPassword(email: email, newPassword: newPassword);
  }

}
