import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/custom_radio.dart';
import 'package:flutter/material.dart';

class GoalBody extends StatelessWidget {
  final String? selectedGoal;
  final ValueChanged<String> onSelectGoal;
  final VoidCallback onNext;

  const GoalBody({
    super.key,
    required this.selectedGoal,
    required this.onSelectGoal,
    required this.onNext,
  });

  static const List<String> _goals = [
    'Gain Weight',
    'Lose Weight',
    'Get Fitter',
    'Gain More Flexible',
    'Learn The Basic',
  ];

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
                  AppStrings.whatIsYourGoal,
                  style: AppTextStyle.extraBold20,
                ),
                Text(
                  AppStrings.thisHelpsUsCreateYourPersonalizedPlan,
                  style: AppTextStyle.regular18,
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
                      ..._goals.map(
                        (goal) => CustomRadioButton(
                          isSelected: selectedGoal == goal,
                          label: goal,
                          onTap: () => onSelectGoal(goal),
                        ),
                      ),
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
                      onPressed: selectedGoal != null ? onNext : null,
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
