// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:fit_zone/ui/main_screen.dart';
import 'package:flutter/material.dart';

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
        RouteManager.mainScreen: (context) => const MainScreen(),
      },
      initialRoute: RouteManager.mainScreen,
    );
  }
}
