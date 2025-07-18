import 'package:easy_localization/easy_localization.dart';
import 'package:fit_zone/core/cache/shared_pref.dart';
import 'package:fit_zone/core/constant.dart';
import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/ui/Auth/forget_password/view/forget_password/view/forget_screen.dart';
import 'package:fit_zone/ui/Auth/login/view/login_screen.dart';
import 'package:fit_zone/ui/Auth/login/viewmodel/login_cubit.dart';
import 'package:fit_zone/ui/Auth/register/register_view.dart';
import 'package:fit_zone/ui/change_password/view/change_password_screen.dart';
import 'package:fit_zone/ui/change_password/view_model/change_password_cubit.dart';
import 'package:fit_zone/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:fit_zone/ui/food/view/food_details_screen.dart';
import 'package:fit_zone/ui/food/view/food_screen.dart';
import 'package:fit_zone/ui/food/view_model/categories_cubit.dart';
import 'package:fit_zone/ui/food/view_model/meals_cubit.dart';
import 'package:fit_zone/ui/main_screen/main_screen.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view/workouts_screen.dart';
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
        RouteManager.editProfileScreen: (context) => const EditProfileScreen(),
        RouteManager.workOutScreen: (context) => const WorkoutsScreen(),
        RouteManager.foodScreen: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => getIt<CategoriesCubit>()),
                BlocProvider(create: (_) => getIt<MealsCubit>()),
              ],
              child: const FoodScreen(),
            ),
        RouteManager.foodDetailsScreen: (context) {
          final mealId = ModalRoute.of(context)!.settings.arguments as String;
          return FoodDetailsScreen(mealId: mealId);
        },
        RouteManager.loginScreen: (context) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            ),

        RouteManager.changePasswordScreen: (context) => BlocProvider(
              create: (context) => getIt<ChangePasswordCubit>(),
              child: const ChangePasswordScreen(),
            ),
      },
      // initialRoute: RouteManager.mainScreen,
      initialRoute: initRoute(),
    );
  }

  String? initRoute() {
    final isRememberMe = CacheHelper.getData<bool>(Constant.isRememberMe);
    final isNewUser = CacheHelper.getData<bool>(Constant.isNewUser);
    if (isRememberMe == true && isNewUser == false) {
      return RouteManager.mainScreen;
    } else if (isRememberMe == false || isRememberMe == null) {
      return RouteManager.loginScreen;
    } else {
      return RouteManager.onBoardingScreen;
    }
  }
}
