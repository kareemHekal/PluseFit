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

  final activityLevels = [
    'Rookie',
    'Beginner',
    'Intermediate',
    'Advance',
    'True Beast',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteRegisterCubit, CompleteRegisterState>(
      builder: (context, state) {
        final cubit = CompleteRegisterCubit.get(context);
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
                          ...activityLevels.map((level) {
                            return CustomRadioButton(
                              isSelected: selectedLevel == level,
                              label: level,
                              onTap: () {
                                cubit.doIntent(
                                    UpdateUserIntent(activityLevel: level));
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
                          onPressed: cubit.user.activityLevel != null
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
