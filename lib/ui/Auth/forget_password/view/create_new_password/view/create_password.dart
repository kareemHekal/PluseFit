import 'package:fit_zone/core/reusable_comp/custom_button.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../../../../core/reusable_comp/custom-form_field.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/string_manager.dart';
import '../../../../../../core/utils/text_style_manager.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repasswordController = TextEditingController();

    return AuthBackgroundCover(
      bodyWidget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 96,),
            Text(AppStrings.enterYourEmail, style: AppTextStyle.regular18),
            const SizedBox(height: 8),
            Text(AppStrings.forgetPassword, style: AppTextStyle.bold20),
            const SizedBox(height: 25),
            CustomFormField(
              title: AppStrings.password,
              hintText: "Enter New password",
              keyboard: TextInputType.visiblePassword,
              controller: passwordController,
              validator: Validator.password,
              maxLength: 50,
              prefixIcon: const Icon(Icons.lock, color: ColorManager.white70, size: 20),
              suffixIcon: const Icon(Icons.remove_red_eye_outlined, color: ColorManager.white70, size: 25),
            ),

            CustomFormField(
              title: AppStrings.password,
              hintText: "Confirm new password",
              keyboard: TextInputType.visiblePassword,
              controller: repasswordController,
              validator: (value) => Validator.confirmPassword(value, passwordController.text),
              maxLength: 50,
              prefixIcon: const Icon(Icons.lock, color: ColorManager.white70, size: 20),
              suffixIcon: const Icon(Icons.remove_red_eye_outlined, color: ColorManager.white70, size: 25),
            ),

            SizedBox(height: 24,),
            CustomButton(
              onPressed: (){
                Navigator.pushNamed(context, RouteManager.otpScreen);
              },
              title: AppStrings.done,
            )
          ],
        ),
      ),
    );
  }
}
