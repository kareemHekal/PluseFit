import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final bool isMale;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderWidget({
    super.key,
    required this.isMale,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 8,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isMale ? Icons.male : Icons.female,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 40,
                ),
                Text(isMale ? AppStrings.male : AppStrings.female,
                    style: AppTextStyle.semiBold12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
