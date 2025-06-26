import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/create_new_password/view/create_password.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/string_manager.dart';
import '../../../../../../core/utils/text_style_manager.dart';
import '../../../../../../core/utils/toast_message.dart';
import '../../../../view_model/cubit/auth_intent.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen(
    this.email, {
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String otp = '';

  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyResetCodeLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Center(
                    child: Lottie.asset(
                      AssetsManager.lottieLoading,
                      width: 150,
                      height: 150,
                      reverse: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            );
          }

          if (state is VerifyResetCodeSuccessState) {
            Navigator.of(context, rootNavigator: true).pop();
            toastMessage(
              message: state.response?.status ?? "Verified successfully",
              tybeMessage: TybeMessage.positive,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateNewPassword(widget.email),
              ),
            );
          }

          if (state is VerifyResetCodeErrorState) {
            Navigator.of(context, rootNavigator: true).pop();
            toastMessage(
              message: state.message ?? "Something went wrong",
              tybeMessage: TybeMessage.negative,
            );
          }

          if (state is SendEmailVerificationSuccessState) {
            Navigator.of(context, rootNavigator: true).pop();
            toastMessage(
              message: state.response?.message ?? "Code resent successfully",
              tybeMessage: TybeMessage.positive,
            );
          }
        },
        child: AuthBackgroundCover(
          backIcon: const BackIcon(),
          bodyWidget: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.otpCode, style: AppTextStyle.bold20),
                    Text(AppStrings.enterYourOtp,
                        style: AppTextStyle.regular18),
                    const SizedBox(height: 16),
                    BlurredContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Pinput(
                              length: 6,
                              showCursor: true,
                              preFilledWidget: preFilledWidget,
                              pinAnimationType: PinAnimationType.slide,
                              controller: TextEditingController(text: otp),
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return 'Please enter full 6-digit OTP';
                                }
                                return null;
                              },
                              onCompleted: (value) {
                                otp = value;
                              },
                              defaultPinTheme: PinTheme(
                                height: 60,
                                width: 60,
                                textStyle: AppTextStyle.medium20.copyWith(
                                  color: ColorManager.primaryColor,
                                ),
                              ),
                              errorPinTheme: PinTheme(
                                height: 60,
                                width: 60,
                                textStyle: AppTextStyle.medium20
                                    .copyWith(color: Colors.red),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.red, width: 1.5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        BlocProvider.of<AuthCubit>(context)
                                            .doIntent(
                                          VerifyResetCode(resetCode: otp),
                                        );
                                      }
                                    },
                                    child: Text(AppStrings.confirm,
                                        style: AppTextStyle.regular16),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            Text(AppStrings.didntRecieve,
                                style: AppTextStyle.medium16),
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
