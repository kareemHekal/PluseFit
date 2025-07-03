part of 'workouts_cubit.dart';

@immutable
sealed class WorkoutsState {}

final class WorkoutsInitial extends WorkoutsState {}

class WorkoutLoadingState extends WorkoutsState {}

class WorkoutGroupSuccessState extends WorkoutsState {
  final List<MusclesGroup> musclesGroup;

  WorkoutGroupSuccessState({required this.musclesGroup});
}

class WorkoutCardSuccessState extends WorkoutsState {
  final List<Muscles> muscles;

  WorkoutCardSuccessState({required this.muscles});
}

class WorkoutFailureState extends WorkoutsState {
  final String message;

  WorkoutFailureState({required this.message});
}
