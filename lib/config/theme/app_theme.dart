// ignore_for_file: deprecated_member_use

import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.primaryColor,
        primary: ColorManager.primaryColor,
        onPrimary: ColorManager.onPrimaryColor,
        secondary: ColorManager.secondaryColor,
        onSecondary: ColorManager.onSecondaryColor,
        tertiary: ColorManager.tertiaryColor,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.normal),
        displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.normal),
        displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        iconColor: ColorManager.tertiaryColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide:
              const BorderSide(color: ColorManager.tertiaryColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide:
              const BorderSide(color: ColorManager.tertiaryColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide:
              const BorderSide(color: ColorManager.secondaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
              color: ColorManager.errorBorderColor, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
              color: ColorManager.errorBorderColor, width: 1.5),
        ),
        labelStyle: const TextStyle(color: ColorManager.tertiaryColor),
        hintStyle: const TextStyle(color: ColorManager.tertiaryColor),
        prefixIconColor: ColorManager.tertiaryColor,
        suffixIconColor: ColorManager.tertiaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
          foregroundColor: ColorManager.onPrimaryColor,
          textStyle: AppTextStyle.semiBold14,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        side: const BorderSide(color: ColorManager.primaryColor),
        foregroundColor: ColorManager.onPrimaryColor,
        textStyle: AppTextStyle.semiBold14,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      )));
}
