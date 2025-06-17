import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/age_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/gender_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/height_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/weight_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'body/goal.dart';
import 'body/physical_activity_body.dart';

class CompleteRegisterScreen extends StatelessWidget {
  const CompleteRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompleteRegisterCubit(),
      child: BlocListener<CompleteRegisterCubit, CompleteRegisterState>(
        listener: (context, state) {
          if (state is ExitScreen) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<CompleteRegisterCubit, CompleteRegisterState>(
          builder: (context, state) {
            final cubit = CompleteRegisterCubit.get(context);
            final bodies = [
              const GenderBody(),
              const AgeBody(),
              const WeightBody(),
              const HeightBody(),
              GoalBody(),
              PhysicalActivityBody(),
              // add here you other pages
            ];

            return AuthBackgroundCover(
                backIcon: BackIcon(
                  onPressed: () {
                    cubit.doIntent(UpdateIndex(isBackButton: true));
                  },
                ),
                bodyWidget: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 30,
                      animation: true,
                      animateFromLastPercent: true,
                      backgroundColor: Colors.transparent,
                      lineWidth: 5.0,
                      percent: cubit.currentIndex / 6,
                      center: Text(
                        "${cubit.currentIndex}/6",
                        style: AppTextStyle.medium14,
                      ),
                      progressColor: Theme.of(context).colorScheme.primary,
                    ),
                    bodies[cubit.currentIndex - 1],
                  ],
                ));
          },
        ),
      ),
    );
  }
}
