import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/core/utils/toast_message.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/age_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/gender_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/height_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/weight_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'body/goal.dart';
import 'body/physical_activity_body.dart';

class CompleteRegisterScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const CompleteRegisterScreen({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CompleteRegisterCubit>()
        ..doIntent(UpdateUserIntent(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        )),
      child: BlocConsumer<CompleteRegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            Navigator.of(context, rootNavigator: true).pop();
            toastMessage(
                message: state.message.toString(),
                tybeMessage: TybeMessage.negative);
          }
          if (state is RegisterSuccessState) {
            Navigator.of(context, rootNavigator: true).pop();
            toastMessage(
                message: AppStrings.yourAccountHasBeenCreatedSuccessfully,
                tybeMessage: TybeMessage.positive);
            Navigator.pushNamed(context, RouteManager.loginScreen);
          }
          if (state is RegisterLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Center(
                    child: Lottie.asset(
                      'assets/lottie/loading.json',
                      width: 150,
                      height: 150,
                      reverse: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            );
          }
          if (state is ExitScreen) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          final cubit = CompleteRegisterCubit.get(context);
          final bodies = [
            const GenderBody(),
            const AgeBody(),
            const WeightBody(),
            const HeightBody(),
            GoalBody(),
            PhysicalActivityBody(),
          ];

          return AuthBackgroundCover(
            backIcon: BackIcon(
              onPressed: () {
                cubit.doIntent(UpdateIndex(isBackButton: true));
              },
            ),
            bodyWidget: Column(
              spacing: 16,
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
            ),
          );
        },
      ),
    );
  }
}
