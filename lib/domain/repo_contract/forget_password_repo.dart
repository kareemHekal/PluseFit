import 'package:fit_zone/data/model/reset_password_response.dart';

import '../../core/api/api_result.dart';
import '../../data/model/forget_pass_response.dart';
import '../../data/model/otp_response.dart';

abstract class ForgetPasswordRepo{
Future<ApiResult<ForgetPasswordResponse>> ForgetPassword({required String email,});
Future<ApiResult<OtpResponse>> verifyResetCode({
  required String resetCode,
});
Future<ApiResult<ResetPasswordResponse>> resetPassword({
  required String email,
  required String newPassword,
});

}