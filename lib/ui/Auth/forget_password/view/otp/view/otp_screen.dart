import 'package:fit_zone/core/reusable_comp/custom_button.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../../../../core/reusable_comp/custom-form_field.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/string_manager.dart';
import '../../../../../../core/utils/text_style_manager.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundCover(
      bodyWidget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 96),
            Text(AppStrings.otpCode, style: AppTextStyle.bold20),
            const SizedBox(height: 8),
            Text(AppStrings.enterYourOtp, style: AppTextStyle.regular18),
            const SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                color: ColorManager.backgroundColorr
              ),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: OtpTextField(
                      numberOfFields: 4,
                      showFieldAsBox: false,
                      cursorColor: ColorManager.primaryColor,
                      borderColor: ColorManager.primaryColor,
                      enabledBorderColor: ColorManager.primaryColor,
                      disabledBorderColor:ColorManager.white ,
                      focusedBorderColor:ColorManager.primaryColor ,
                      textStyle: AppTextStyle.regular18.copyWith(color: ColorManager.primaryColor),

                      fieldWidth: 52,
                      fieldHeight: 52,
                      borderWidth: 0,
                      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 5.5),
                      mainAxisAlignment: MainAxisAlignment.center,
                      filled: false,
                      onSubmit: (String verificationCode) {
                        setState(() {
                          otp = verificationCode;
                        });
                      },



                    ),


                  ),

                  const SizedBox(height: 24),
                  CustomButton(
                    onPressed: () {
                      print("Submitted OTP: $otp");
                      // تحقق أو إرسال الكود هنا
                    },
                    title: AppStrings.confirm,
                  ),
                  const SizedBox(height: 4),
                  Text(AppStrings.didntRecieve,style: AppTextStyle.medium16,),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      ///
                    },
                    child: Text(AppStrings.resendCode,style: AppTextStyle.medium16.copyWith(
                      color: ColorManager.primaryColor,
                      decoration:TextDecoration.underline,
                      decorationColor: ColorManager.primaryColor,
                    ),),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
