import 'package:easy_localization/easy_localization.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/forget_password/view/forget_screen.dart';
import 'package:fit_zone/ui/Auth/register/register_view.dart';
import 'package:fit_zone/ui/food/view/food_screen.dart';
import 'package:fit_zone/ui/food/view_model/categories_cubit.dart';
import 'package:fit_zone/ui/food/view_model/meals_cubit.dart';
import 'package:fit_zone/ui/main_screen.dart';
import 'package:fit_zone/ui/splash_onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/app_theme.dart';
import 'core/di/di.dart';
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
        RouteManager.mainScreen: (context) => const MainScreen(),
        RouteManager.forgetPassword: (context) => const ForgetPasswordScreen(),
       // RouteManager.otpScreen: (context) =>  const OtpScreen(),
        //RouteManager.createNewPassword: (context) =>  const CreateNewPassword(),
        RouteManager.registerScreen: (context) => const RegisterView(),
        RouteManager.onBoardingScreen: (context) => const OnBoardingScreen(),
        RouteManager.foodScreen: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<CategoriesCubit>()),
            BlocProvider(create: (_) => getIt<MealsCubit>()),
          ],
          child: const FoodScreen(),
        ),
      },
      // initialRoute: RouteManager.mainScreen,
     initialRoute: RouteManager.onBoardingScreen,
    );
  }
}
