import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/custom_radio.dart';
import 'package:flutter/material.dart';

class PhysicalActivityBody extends StatelessWidget {
  final String? selectedLevel;
  final ValueChanged<String> onSelect;
  final VoidCallback onNext;

  const PhysicalActivityBody({
    super.key,
    required this.selectedLevel,
    required this.onSelect,
    required this.onNext,
  });

  static const Map<String, String> _activityLevels = {
    'Rookie': 'level1',
    'Beginner': 'level2',
    'Intermediate': 'level3',
    'Advance': 'level4',
    'True Beast': 'level5',
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.yourRegularPhysical,
                  style: AppTextStyle.extraBold20,
                ),
                Text(
                  AppStrings.activityLevel,
                  style: AppTextStyle.extraBold20,
                ),
              ],
            ),
          ),
          BlurredContainer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ..._activityLevels.entries.map((entry) {
                        final display = entry.key;
                        final value = entry.value;
                        return CustomRadioButton(
                          isSelected: selectedLevel == value,
                          label: display,
                          onTap: () => onSelect(value),
                        );
                      }),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedLevel != null ? onNext : null,
                      child: Text(AppStrings.next),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
