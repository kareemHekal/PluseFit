part of 'auth_cubit.dart';

 sealed class AuthState {}

final class AuthInitial extends AuthState {}///  FORGOT PASSWORD STATES  ///

final class SendEmailVerificationSuccessState extends AuthState {
  ForgetPasswordResponse? response;
  SendEmailVerificationSuccessState(  this.response);
}

final class SendEmailVerificationLoadingState extends AuthState {
  SendEmailVerificationLoadingState();
}

final class SendEmailVerificationErrorState extends AuthState {
  String? message;
  SendEmailVerificationErrorState( this.message);
}

///  VERIFY RESET CODE STATES  ///

final class VerifyResetCodeSuccessState extends AuthState {
  OtpResponse? response;
  VerifyResetCodeSuccessState({required this.response});
}

final class VerifyResetCodeLoadingState extends AuthState {
  VerifyResetCodeLoadingState();
}

// ignore: must_be_immutable
final class VerifyResetCodeErrorState extends AuthState {
  String? message;
  VerifyResetCodeErrorState({required this.message});
}

///  PASSWORD RESET STATES  ///

final class ResetPasswordSuccessState extends AuthState {
  ResetPasswordResponse? response  ;
  ResetPasswordSuccessState({required this.response});
}

final class ResetPasswordLoadingState extends AuthState {
  ResetPasswordLoadingState();
}

final class ResetPasswordErrorState extends AuthState {
  String? message;
  ResetPasswordErrorState({required this.message});
}