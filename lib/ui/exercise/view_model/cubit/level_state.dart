part of 'level_cubit.dart';

@immutable
sealed class ExerciseState {}

final class LevelInitial extends ExerciseState {}

///Exercise
final class ExerciseSuccessState extends ExerciseState {
  final  ExerciseByMuscleResponse? response;
  ExerciseSuccessState(  this.response);
}

final class ExerciseLoadingState extends ExerciseState {
  ExerciseLoadingState();
}

final class ExerciseErrorState extends ExerciseState {
  final  String? message;
  ExerciseErrorState( this.message);
}


final class LevelSuccessState extends ExerciseState {
  final  GetAllLevelResponse? response;
  LevelSuccessState(  this.response);
}

final class LevelLoadingState extends ExerciseState {
  LevelLoadingState();
}

final class LevelErrorState extends ExerciseState {
  final  String? message;
  LevelErrorState( this.message);
}
