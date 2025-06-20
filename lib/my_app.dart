// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
 import 'package:fit_zone/ui/Auth/forget_password/view/create_new_password/view/create_password.dart';import 'package:fit_zone/ui/Auth/forget_password/view/forget_password/view/forget_screen.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/otp/view/otp_screen.dart';
import 'package:fit_zone/ui/main_screen.dart';
import 'package:fit_zone/ui/splash_onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/theme/app_theme.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        RouteManager.mainScreen: (context) => const MainScreen(),
        RouteManager.forgetPassword: (context) => const ForgetPasswordScreen(),
       // RouteManager.otpScreen: (context) =>  const OtpScreen(),
        //RouteManager.createNewPassword: (context) =>  const CreateNewPassword(),
      },
      // initialRoute: RouteManager.mainScreen,
     initialRoute: RouteManager.forgetPassword,
    );
  }
}
