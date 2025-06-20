// ignore_for_file: camel_case_types


///  Auth Intent ///
// ignore_for_file: non_constant_identifier_names, dangling_library_doc_comments

sealed class AuthIntent {}

///  FORGOT PASSWORD INTENT ///
class ForgetPassword extends AuthIntent {
  final String email;
  ForgetPassword({required this.email});
}

///  VERIFY RESET CODE INTENT ///
class VerifyResetCode extends AuthIntent {
  final String resetCode;
  VerifyResetCode({required this.resetCode});
}
///  RESET PASSWORD INTENT ///
class ResetPassword extends AuthIntent {
  final String email;
  final String NewPassword;

  ResetPassword({required this.email, required this.NewPassword});
}
