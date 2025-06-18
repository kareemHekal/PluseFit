import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/custom_radio.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhysicalActivityBody extends StatelessWidget {
  PhysicalActivityBody({super.key});

  final activityLevels = {
    'Rookie': 'level1',
    'Beginner': 'level2',
    'Intermediate': 'level3',
    'Advance': 'level4',
    'True Beast': 'level5',
  };

  @override
  Widget build(BuildContext context) {
    final cubit = CompleteRegisterCubit.get(context);
    return BlocBuilder<CompleteRegisterCubit, RegisterStates>(
      builder: (context, state) {
        String? selectedLevel = cubit.user.activityLevel;
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
                          ...activityLevels.entries.map((entry) {
                            final displayName = entry.key;
                            final value = entry.value;
                            return CustomRadioButton(
                              isSelected: selectedLevel == value,
                              label: displayName,
                              onTap: () {
                                cubit.doIntent(
                                    UpdateUserIntent(activityLevel: value));
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
                          onPressed: selectedLevel != null
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
