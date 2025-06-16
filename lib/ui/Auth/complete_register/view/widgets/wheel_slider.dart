import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class CustomWheelSlider extends StatelessWidget {
  final int totalCount;
  final int initialValue;
  final ValueChanged<int> onChanged;

  const CustomWheelSlider({
    super.key,
    required this.totalCount,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return WheelSlider.number(
      perspective: 0.003,
      totalCount: totalCount,
      selectedNumberStyle: AppTextStyle.extraBold30
          .copyWith(color: Theme.of(context).colorScheme.primary),
      initValue: initialValue,
      unSelectedNumberStyle: AppTextStyle.extraBold25,
      currentIndex: initialValue,
      onValueChanged: (val) {
        onChanged(val as int);
      },
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
    );
  }
}
