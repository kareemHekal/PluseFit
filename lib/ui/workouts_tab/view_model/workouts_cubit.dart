import 'package:bloc/bloc.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/domain/use_cases/fitness_usecase.dart';
import 'package:fit_zone/ui/workouts_tab/view_model/workouts_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'workouts_state.dart';

@injectable
class WorkoutsCubit extends Cubit<WorkoutsState> {
  final FitnessUsecase fitnessUsecase;

  @factoryMethod
  WorkoutsCubit(this.fitnessUsecase) : super(WorkoutsInitial());

  Future<void> _getWorkoutCard(String cardId) async {
    emit(WorkoutLoadingState());
    final result = await fitnessUsecase.execute(cardId);

    switch (result) {
      case SuccessApiResult():
        emit(WorkoutCardSuccessState(muscles: result.data ?? []));
      case ErrorApiResult():
        emit(WorkoutFailureState(message: result.exception.toString()));
    }
  }

  Future<void> _getTabWorkout(WorkoutsGroupTabIntent intent) async {
    emit(WorkoutLoadingState());

    final result = await fitnessUsecase.call(
      id: intent.id,
      name: intent.name,
    );

    if (result is SuccessApiResult<List<MusclesGroup>>) {
      emit(WorkoutGroupSuccessState(musclesGroup: result.data!));
    } else if (result is ErrorApiResult<List<MusclesGroup>>) {
      emit(WorkoutFailureState(message: result.exception.toString()));
    }
  }

  void doIntent(WorkoutsIntent intent) {
    switch (intent) {
      case WorkoutsGroupTabIntent():
        _getTabWorkout(intent);
        break;
      case WorkoutsCardIntent():
        _getWorkoutCard(intent.cardId);
        break;
    }
  }
}
