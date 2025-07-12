import 'package:fit_zone/config/theme/app_theme.dart';
import 'package:fit_zone/core/reusable_comp/fitness_card_resuble/fitness_card_builder.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view_model/workouts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutCardScreen extends StatelessWidget {
  const WorkoutCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        switch (state) {
          case WorkoutLoadingState():
            return const Center(child: CircularProgressIndicator());
          case WorkoutCardSuccessState():
            if (state.muscles.isEmpty) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.no_sim_sharp, size: 35, color: ColorManager.red),
                    const SizedBox(width: 10),
                    Text(
                      AppStrings.noWorkoutFound,
                      style: AppTheme.lightTheme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              );
            } else {
              return FitnessCardBuilder(
                muscles: state.muscles,
                onTap: () {

                },
              );
            }
          case WorkoutFailureState():
            return Center(child: Text(state.message));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
