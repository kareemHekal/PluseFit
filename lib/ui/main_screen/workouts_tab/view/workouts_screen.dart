import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view_model/workouts_cubit.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view_model/workouts_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/tab_workout.dart';
import 'widget/workout_card_screen.dart';

class WorkoutsScreen extends StatefulWidget {
  final String? selectedfitnessId;

  const WorkoutsScreen({super.key, this.selectedfitnessId});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  String workoutID = "";
  late final WorkoutsCubit _workoutsCubit;

  @override
  void initState() {
    super.initState();
    _workoutsCubit = getIt<WorkoutsCubit>();
    final id = widget.selectedfitnessId ?? workoutID;
    _workoutsCubit.doIntent(WorkoutsCardIntent(cardId: id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.imagesHomeBackground),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: TabWorkout(
                  id: widget.selectedfitnessId ?? workoutID,
                  workoutsCubit: _workoutsCubit,
                  onCategorySelected: (selectedfitnessId) {
                    setState(() {
                      workoutID = selectedfitnessId ?? "";
                    });
                    _workoutsCubit.doIntent(
                      WorkoutsCardIntent(cardId: workoutID),
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                flex: 6,
                child: BlocProvider.value(
                  value: _workoutsCubit,
                  child: const WorkoutCardScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
