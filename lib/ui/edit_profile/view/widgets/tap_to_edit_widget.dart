import 'dart:ui';

import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class TapToEditWidget extends StatelessWidget {
  final VoidCallback onTapToEdit;
  final String labelTap;
  final String value;

  const TapToEditWidget({
    super.key,
    required this.onTapToEdit,
    required this.labelTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text: Your X (Tap to Edit)
        GestureDetector(
          onTap: onTapToEdit,
          child: Text.rich(
            TextSpan(
              text: " ${AppStrings.your} $labelTap ",
              style: AppTextStyle.medium16,
              children: [
                TextSpan(
                  text: "( ",
                  style: AppTextStyle.medium16.copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: AppStrings.tapToEdit,
                  style: AppTextStyle.medium16.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: " )",
                  style: AppTextStyle.medium16.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        // Full width blur container
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 2),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: AppTextStyle.medium16,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
