import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../../../../core/utils/string_manager.dart';
import '../../../../../../core/utils/text_style_manager.dart';
import '../../../../../../core/utils/toast_message.dart';
import '../../../../view_model/cubit/auth_intent.dart';

class CreateNewPassword extends StatelessWidget {
  final String email;

  const CreateNewPassword(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController rePasswordController = TextEditingController();

    return AuthBackgroundCover(
      backIcon: const BackIcon(),
      bodyWidget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppStrings.enterYourEmail, style: AppTextStyle.regular18),
              Text(AppStrings.forgetPassword, style: AppTextStyle.bold20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: AppStrings.createNewPasssword,
                  prefixIcon: const Icon(Icons.lock),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                validator: Validator.password,
              ),
              TextFormField(
                controller: rePasswordController,
                decoration: InputDecoration(
                  labelText: AppStrings.confirmTheNewPassword,
                  prefixIcon: const Icon(Icons.lock),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                validator: (value) =>
                    Validator.confirmPassword(value, passwordController.text),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
                if (state is ResetPasswordLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).doIntent(
                        ResetPassword(
                            email: email,
                            NewPassword: rePasswordController.text),
                      );
                    },
                    child: Text(AppStrings.done, style: AppTextStyle.regular16),
                  ),
                );
              }, listener: (context, state) {
                if (state is ResetPasswordSuccessState) {
                  toastMessage(
                    message: state.response?.message ??
                        "Password reset successfully",
                    tybeMessage: TybeMessage.positive,
                  );
                  Navigator.pushNamed(context, RouteManager.loginScreen);
                } else if (state is ResetPasswordErrorState) {
                  toastMessage(
                    message: state.message ?? "Unknown error",
                    tybeMessage: TybeMessage.negative,
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
