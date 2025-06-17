import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/custom_radio.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalBody extends StatelessWidget {
  GoalBody({super.key});

  final goals = [
    'Gain Weight',
    'Lose Weight',
    'Get Fitter',
    'Gain More Flexible',
    'Learn The Basic',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteRegisterCubit, CompleteRegisterState>(
      builder: (context, state) {
        final cubit = CompleteRegisterCubit.get(context);
        String? selectedLevel = cubit.user.goal;
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
                          ...goals.map((level) {
                            return CustomRadioButton(
                              isSelected: selectedLevel == level,
                              label: level,
                              onTap: () {
                                cubit.doIntent(UpdateUserIntent(goal: level));
                              },
                            );
                          }),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: cubit.user.goal != null
                              ? () {
                                  cubit.doIntent(
                                      UpdateIndex(isBackButton: false));
                                }
                              : null,
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
      },
    );
  }
}
