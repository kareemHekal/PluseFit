import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/triangle.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/wheel_slider.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeBody extends StatefulWidget {
  const AgeBody({super.key});

  @override
  State<AgeBody> createState() => _AgeBodyState();
}

class _AgeBodyState extends State<AgeBody> {
  int scrollValue = 18;

  @override
  void initState() {
    super.initState();
    final cubit = CompleteRegisterCubit.get(context);
    scrollValue = (cubit.user.age ?? 18).toInt();
  }

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
                      AppStrings.howOldAreYou,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        AppStrings.year,
                        style: AppTextStyle.semiBold16.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      CustomWheelSlider(
                        initialValue: scrollValue,
                        totalCount: 99,
                        onChanged: (val) {
                          setState(() {
                            scrollValue = val;
                          });
                        },
                      ),
                      const Triangle(size: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.doIntent(UpdateIndex(isBackButton: false));
                            cubit.doIntent(UpdateUserIntent(age: scrollValue));
                          },
                          child: Text(AppStrings.next),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
