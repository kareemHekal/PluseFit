// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:fit_zone/data/model/forget_pass_response.dart';
import 'package:fit_zone/data/model/otp_response.dart';
import 'package:fit_zone/data/model/reset_password_response.dart';
import 'package:fit_zone/domain/use_cases/forget_password_usecases/otp_usecase.dart';
import 'package:fit_zone/domain/use_cases/forget_password_usecases/reset_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_result.dart';
import '../../../../domain/use_cases/forget_password_usecases/forget_password_usecase.dart';
import 'auth_intent.dart';
part 'auth_state.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  OtpUsecase otpUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;


  AuthCubit(this.forgetPasswordUseCase,this.otpUsecase,this.resetPasswordUsecase) : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  void doIntent(AuthIntent intent) {
    if (intent is ForgetPassword) {
      _forgetPassword(intent: intent);
    } else if(intent is VerifyResetCode){
      _verifyResetCode(intent: intent);
    }else if(intent is ResetPassword){
      _resetPassowrd(intent:intent);
    }
  }

  Future<void> _forgetPassword({required ForgetPassword intent}) async {
    emit(SendEmailVerificationLoadingState());

    final result = await forgetPasswordUseCase.call(email: intent.email);

    if (result is SuccessApiResult<ForgetPasswordResponse>) {
      emit(SendEmailVerificationSuccessState(result.data));
    } else if (result is ErrorApiResult<ForgetPasswordResponse>) {
      emit(SendEmailVerificationErrorState(result.exception.toString()));
    }
  }

  Future<void> _verifyResetCode({required VerifyResetCode intent}) async{
    emit(VerifyResetCodeLoadingState());
    final result = await otpUsecase.call(resetCode: intent.resetCode);
    if(result is SuccessApiResult<OtpResponse>){
      emit(VerifyResetCodeSuccessState(response: result.data));
  }else if(result is ErrorApiResult<OtpResponse>){
    emit(VerifyResetCodeErrorState(message: result.exception.toString()));
    }
  }

  Future<void> _resetPassowrd({required ResetPassword intent}) async{
    emit(ResetPasswordLoadingState());
    final result = await resetPasswordUsecase.call(email: intent.email, newPassword: intent.NewPassword);
    if(result is SuccessApiResult<ResetPasswordResponse>){
      emit(ResetPasswordSuccessState(response: result.data));
    }else if(result is ErrorApiResult<ResetPasswordResponse>){
      emit(ResetPasswordErrorState(message: result.exception.toString()));
    }
  }
}
