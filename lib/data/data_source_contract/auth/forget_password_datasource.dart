import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/otp_response.dart';
import 'package:fit_zone/data/model/reset_password_response.dart';

import '../../model/forget_pass_response.dart';

abstract class ForgetPasswordDatasource{

  Future<ApiResult<ForgetPasswordResponse>> ForgetPassword({
    required String email,
  });
  Future<ApiResult<OtpResponse>> verifyResetCode({
    required String resetCode,
  });
  Future<ApiResult<ResetPasswordResponse>> resetPassword({
    required String email,
    required String newPassword,
  });
}