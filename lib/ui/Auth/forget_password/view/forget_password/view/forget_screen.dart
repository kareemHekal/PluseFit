import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/core/utils/toast_message.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/otp/view/otp_screen.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void forgetPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<AuthCubit>(context).doIntent(
        ForgetPassword(email: _emailController.text),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendEmailVerificationSuccessState) {
          Navigator.of(context, rootNavigator: true).pop();

          toastMessage(
            message: state.response?.message ?? "",
            tybeMessage: TybeMessage.positive,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(_emailController.text),
            ),
          );
        }
        if (state is SendEmailVerificationLoadingState) {
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
        if (state is SendEmailVerificationErrorState) {
          Navigator.of(context, rootNavigator: true).pop();
          toastMessage(
            message: state.message ?? "",
            tybeMessage: TybeMessage.negative,
          );
        }
      },
      builder: (context, state) {
        return AuthBackgroundCover(
          backIcon: const BackIcon(),
          bodyWidget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppStrings.enterYourEmail,
                        style: AppTextStyle.regular18),
                    Text(AppStrings.forgetPassword, style: AppTextStyle.bold20),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const ValueKey('email'),
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      validator: Validator.email,
                      controller: _emailController,
                      style: AppTextStyle.regular16.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: forgetPressed,
                          child: Text(AppStrings.sendOtp,
                              style: AppTextStyle.regular16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
