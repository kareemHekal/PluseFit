import 'package:easy_localization/easy_localization.dart';
import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/forget_password/view/forget_screen.dart';
import 'package:fit_zone/ui/Auth/login/view/login_screen.dart';
import 'package:fit_zone/ui/Auth/login/viewmodel/login_cubit.dart';
import 'package:fit_zone/ui/Auth/register/register_view.dart';
import 'package:fit_zone/ui/main_screen/main_screen.dart';
import 'package:fit_zone/ui/splash_onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_theme.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        RouteManager.mainScreen: (context) => const MainNavigationScreen(),
        RouteManager.forgetPassword: (context) => const ForgetPasswordScreen(),
        // RouteManager.otpScreen: (context) =>  const OtpScreen(),
        //RouteManager.createNewPassword: (context) =>  const CreateNewPassword(),
        RouteManager.registerScreen: (context) => const RegisterView(),
        RouteManager.onBoardingScreen: (context) => const OnBoardingScreen(),
        RouteManager.loginScreen: (context) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            ),
      },
      // initialRoute: RouteManager.mainScreen,
      initialRoute: RouteManager.onBoardingScreen,
    );
  }
}
