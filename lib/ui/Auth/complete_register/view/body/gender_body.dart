import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/domain/entity/gender_enum.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/gender_widget.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderBody extends StatelessWidget {
  const GenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CompleteRegisterCubit.get(context);

    return BlocBuilder<CompleteRegisterCubit, RegisterStates>(
      builder: (context, state) {
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
                      AppStrings.tellUsAboutYourself,
                      style: AppTextStyle.extraBold20,
                    ),
                    Text(AppStrings.weNeedToKnowYourGender,
                        style: AppTextStyle.regular18),
                  ],
                ),
              ),
              BlurredContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10),
                      GenderWidget(
                        onTap: () {
                          cubit.doIntent(UpdateUserIntent(gender: Gender.male));
                        },
                        isMale: true,
                        isSelected: cubit.user.gender == Gender.male,
                      ),
                      GenderWidget(
                        onTap: () {
                          cubit.doIntent(
                              UpdateUserIntent(gender: Gender.female));
                        },
                        isMale: false,
                        isSelected: cubit.user.gender == Gender.female,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: cubit.user.gender == Gender.male ||
                                  cubit.user.gender == Gender.female
                              ? () {
                                  cubit.doIntent(
                                      UpdateIndex(isBackButton: false));
                                }
                              : null,
                          child: Text(AppStrings.save),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
