import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/custom_button.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/create_new_password/view/create_password.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/string_manager.dart';
import '../../../../../../core/utils/text_style_manager.dart';
import '../../../../../../core/utils/toast_message.dart';
import '../../../../view_model/cubit/auth_intent.dart';

class OtpScreen extends StatefulWidget {
  final String email;
   const OtpScreen(this.email,{super.key,});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SendEmailVerificationSuccessState) {
            toastMessage(
              message: state.response?.message ?? "Code resent successfully",
              tybeMessage: TybeMessage.positive,
            );
          } else if (state is SendEmailVerificationErrorState) {
            toastMessage(
              message: state.message ?? "Failed to resend code",
              tybeMessage: TybeMessage.negative,
            );
          } else if (state is VerifyResetCodeErrorState) {
            toastMessage(
              message: state.message.toString(),
              tybeMessage: TybeMessage.negative,
            );
          } else if (state is VerifyResetCodeSuccessState) {
            toastMessage(
              message: state.response!.status.toString(),
              tybeMessage: TybeMessage.positive,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateNewPassword(widget.email),
              ),
            );
          }
        },
        child: AuthBackgroundCover(
          bodyWidget: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 96),
                Text(AppStrings.otpCode, style: AppTextStyle.bold20),
                const SizedBox(height: 8),
                Text(AppStrings.enterYourOtp, style: AppTextStyle.regular18),
                const SizedBox(height: 25),
                Container(
                  decoration: const BoxDecoration(
                    color: ColorManager.backgroundColorr,
                  ),
                  child: Column(
                    children: [
                      OtpTextField(
                        numberOfFields: 6,
                        showFieldAsBox: false,
                        cursorColor: ColorManager.primaryColor,
                        borderColor: ColorManager.primaryColor,
                        enabledBorderColor: ColorManager.primaryColor,
                        disabledBorderColor: ColorManager.white,
                        focusedBorderColor: ColorManager.primaryColor,
                        textStyle: AppTextStyle.regular18.copyWith(
                          color: ColorManager.primaryColor,
                        ),
                        fieldWidth: 52,
                        fieldHeight: 52,
                        borderWidth: 0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 5.5,
                        ),
                        mainAxisAlignment: MainAxisAlignment.center,
                        filled: false,
                        onSubmit: (String verificationCode) {
                          setState(() {
                            otp = verificationCode;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is VerifyResetCodeLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return CustomButton(
                            onPressed: () {
                              if (otp.length == 6) {
                                BlocProvider.of<AuthCubit>(context).doIntent(
                                  VerifyResetCode(resetCode: otp),
                                );
                              } else {
                                toastMessage(
                                  message: "Please enter the complete OTP code",
                                  tybeMessage: TybeMessage.negative,
                                );
                              }
                            },
                            title: AppStrings.confirm,
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      Text(AppStrings.didntRecieve,
                          style: AppTextStyle.medium16),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).doIntent(
                            ForgetPassword(email: widget.email),
                          );
                        },
                        child: Text(
                          AppStrings.resendCode,
                          style: AppTextStyle.medium16.copyWith(
                            color: ColorManager.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorManager.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
