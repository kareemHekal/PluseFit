import 'package:fit_zone/core/reusable_comp/custom_button.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/otp/view/otp_screen.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_intent.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../../../../core/reusable_comp/custom_form_field.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/string_manager.dart';
import '../../../../../../core/utils/text_style_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/toast_message.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: AuthBackgroundCover(
        bodyWidget: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 96),
              Text(AppStrings.enterYourEmail, style: AppTextStyle.regular18),
              const SizedBox(height: 8),
              Text(AppStrings.forgetPassword, style: AppTextStyle.bold20),
              const SizedBox(height: 25),
              CustomFormField(
                title: AppStrings.email,
                hintText: "Enter your email",
                keyboard: TextInputType.emailAddress,
                controller: emailController,
                validator: Validator.email,
                maxLength: 50,
                prefixIcon: const Icon(Icons.email_outlined, color: ColorManager.white70, size: 20),
              ),
              const SizedBox(height: 24),
              BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state) {
                  if(state is SendEmailVerificationLoadingState){
                    return  const Center(child: CircularProgressIndicator(),);
                  }
                  return CustomButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).doIntent(
                        ForgetPassword(email: emailController.text),
                      );

                    },
                    title: AppStrings.sendOtp,
                  );
                },
                listener: (context, state) {
                  if (state is SendEmailVerificationSuccessState) {
                    toastMessage(
                      message: state.response?.message ?? "",
                      tybeMessage: TybeMessage.positive,
                    );
                    Navigator.push(context,  MaterialPageRoute(
                      builder:  (context) => OtpScreen(emailController.text),));
                    //Navigator.pushNamed(context, RouteManager.otpScreen); // ✅ التنقل بعد النجاح
                  } else if (state is SendEmailVerificationErrorState) {
                    toastMessage(
                      message: state.message ?? "",
                      tybeMessage: TybeMessage.negative,
                    );
                  }
                },
              )


            ],
          ),
        ),
      ),
    );
  }
}