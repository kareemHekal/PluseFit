import 'package:fit_zone/domain/entity/workouts_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UpcomingWorkoutsStates {}

class UpcomingWorkoutsInitial extends UpcomingWorkoutsStates {}

class UpcomingWorkoutsLoading extends UpcomingWorkoutsStates {}

class UpcomingWorkoutsSuccess extends UpcomingWorkoutsStates {
  final List<MuscleGroupEntity> muscleGroups;
  final List<WorkoutEntity> workouts;
  final int selectedIndex;

  UpcomingWorkoutsSuccess(
      {required this.muscleGroups,
      required this.workouts,
      required this.selectedIndex});

  UpcomingWorkoutsSuccess copyWith({
    List<MuscleGroupEntity>? muscleGroups,
    List<WorkoutEntity>? workouts,
    int? selectedIndex,
  }) {
    return UpcomingWorkoutsSuccess(
      muscleGroups: muscleGroups ?? this.muscleGroups,
      workouts: workouts ?? this.workouts,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

class UpcomingWorkoutsError extends UpcomingWorkoutsStates {
  final String message;

  UpcomingWorkoutsError(this.message);
}
