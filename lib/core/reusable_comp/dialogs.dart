import 'package:easy_localization/easy_localization.dart';
import 'package:fit_zone/config/theme/app_theme.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void confirmLogout(BuildContext context, VoidCallback cancelButton,
      VoidCallback logoutButton) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: ColorManager.dialog,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppStrings.areYouSureToCloseTheApplication.tr(),
                    textAlign: TextAlign.center,
                    style: AppTheme.lightTheme.textTheme.headlineMedium
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: cancelButton,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: const BorderSide(
                              color: ColorManager.primaryColor),
                        ),
                        child: Text(
                          AppStrings.no.tr(),
                          style: AppTheme.lightTheme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: logoutButton,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColor,
                          // Customize your color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          AppStrings.yes.tr(),
                          style: AppTheme.lightTheme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
