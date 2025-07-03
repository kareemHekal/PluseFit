import 'package:bloc/bloc.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/domain/use_cases/fitness_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'workouts_intent.dart';

part 'workouts_state.dart';

@injectable
class WorkoutsCubit extends Cubit<WorkoutsState> {
  final FitnessUsecase _fitnessUsecase;

  @factoryMethod
  WorkoutsCubit(this._fitnessUsecase) : super(WorkoutsInitial());

  Future<void> _getWorkoutCard(String cardId) async {
    emit(WorkoutLoadingState());
    final result = await _fitnessUsecase.callMuscles(cardId);

    switch (result) {
      case SuccessApiResult():
        emit(WorkoutCardSuccessState(muscles: result.data ?? []));
      case ErrorApiResult():
        emit(WorkoutFailureState(message: result.exception.toString()));
    }
  }

  Future<void> getTabWorkout(WorkoutsGroupTabIntent intent) async {
    emit(WorkoutLoadingState());

    final result = await _fitnessUsecase.callGroup(
      id: intent.id,
      name: intent.name,
    );

    if (result is SuccessApiResult<List<MusclesGroup>>) {
      emit(WorkoutGroupSuccessState(musclesGroup: result.data!));
    } else if (result is ErrorApiResult<List<MusclesGroup>>) {
      emit(WorkoutFailureState(message: result.exception.toString()));
    }
  }

  Future<ApiResult<List<MusclesGroup>>> fetchTabCategories({
    required String id,
    String name = '',
  }) {
    return _fitnessUsecase.callGroup(id: id, name: name);
  }

  void doIntent(WorkoutsIntent intent) {
    switch (intent) {
      case WorkoutsGroupTabIntent():
        getTabWorkout(intent);
        break;
      case WorkoutsCardIntent():
        _getWorkoutCard(intent.cardId);
        break;
    }
  }
}
