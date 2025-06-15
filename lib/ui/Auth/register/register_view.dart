import 'package:fit_zone/core/resuable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundCuver(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/icon/app_icon.png"),
          Text(
            "Hey There",
            style: AppTextStyle.regular18.copyWith(color: Colors.white),
          ),
          Text(
            "create an account",
            style: AppTextStyle.semiBold20.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
