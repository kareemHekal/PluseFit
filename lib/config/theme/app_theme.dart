// ignore_for_file: deprecated_member_use

import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      scaffoldBackgroundColor: Colors.transparent,
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
        displayLarge: TextStyle(
            fontSize: 57,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        displayMedium: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        displaySmall: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: ColorManager.white),
        titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorManager.white),
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorManager.white),
        bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: ColorManager.white),
        labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorManager.white),
        labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ColorManager.white),
        labelSmall: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: ColorManager.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
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
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return ColorManager.tertiaryColor;
              }
              return ColorManager.primaryColor;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.white; // لون الخط لما يكون disabled
              }
              return ColorManager.onPrimaryColor;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return const BorderSide(color: Colors.white, width: 1.5);
              }
              return null;
            },
          ),
          textStyle: MaterialStateProperty.all(AppTextStyle.extraBold14),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 8),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
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
