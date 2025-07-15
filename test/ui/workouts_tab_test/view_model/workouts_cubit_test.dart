import 'package:bloc_test/bloc_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/domain/use_cases/fitness_usecase.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view_model/workouts_cubit.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view_model/workouts_intent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'workouts_cubit_test.mocks.dart';

@GenerateMocks([FitnessUsecase])
void main() {
  group('WorkoutsCubit', () {
    late WorkoutsCubit workoutsCubit;
    late MockFitnessUsecase mockFitnessUsecase;

    setUp(() {
      mockFitnessUsecase = MockFitnessUsecase();
      workoutsCubit = WorkoutsCubit(mockFitnessUsecase);
    });

    final mockMuscles = [Muscles(id: '1', name: 'Biceps')];
    final mockMusclesGroup = [MusclesGroup(id: '1', name: 'Upper Body')];

    provideDummy<ApiResult<List<Muscles>>>(
      SuccessApiResult(mockMuscles),
    );

    provideDummy<ApiResult<List<MusclesGroup>>>(
      SuccessApiResult(mockMusclesGroup),
    );

    blocTest<WorkoutsCubit, WorkoutsState>(
      'emits [WorkoutLoadingState, WorkoutCardSuccessState] when callMuscles returns success',
      build: () {
        when(mockFitnessUsecase.callMuscles('card1'))
            .thenAnswer((_) async => SuccessApiResult(mockMuscles));
        return workoutsCubit;
      },
      act: (cubit) => cubit.doIntent(WorkoutsCardIntent(cardId: 'card1')),
      expect: () => [
        isA<WorkoutLoadingState>(),
        isA<WorkoutCardSuccessState>(),
      ],
    );

    blocTest<WorkoutsCubit, WorkoutsState>(
      'emits [WorkoutLoadingState, WorkoutFailureState] when callMuscles returns error',
      build: () {
        when(mockFitnessUsecase.callMuscles('card1'))
            .thenAnswer((_) async => ErrorApiResult(Exception('Failed to load muscles')));
        return workoutsCubit;
      },
      act: (cubit) => cubit.doIntent(WorkoutsCardIntent(cardId: 'card1')),
      expect: () => [
        isA<WorkoutLoadingState>(),
        isA<WorkoutFailureState>(),
      ],
    );

    blocTest<WorkoutsCubit, WorkoutsState>(
      'emits [WorkoutLoadingState, WorkoutGroupSuccessState] when callGroup returns success',
      build: () {
        when(mockFitnessUsecase.callGroup(id: 'id1', name: 'Legs'))
            .thenAnswer((_) async => SuccessApiResult(mockMusclesGroup));
        return workoutsCubit;
      },
      act: (cubit) => cubit.doIntent(WorkoutsGroupTabIntent(id: 'id1', name: 'Legs')),
      expect: () => [
        isA<WorkoutLoadingState>(),
        isA<WorkoutGroupSuccessState>(),
      ],
    );

    blocTest<WorkoutsCubit, WorkoutsState>(
      'emits [WorkoutLoadingState, WorkoutFailureState] when callGroup returns error',
      build: () {
        when(mockFitnessUsecase.callGroup(id: 'id1', name: 'Legs'))
            .thenAnswer((_) async => ErrorApiResult(Exception('Group load failed')));
        return workoutsCubit;
      },
      act: (cubit) => cubit.doIntent(WorkoutsGroupTabIntent(id: 'id1', name: 'Legs')),
      expect: () => [
        isA<WorkoutLoadingState>(),
        isA<WorkoutFailureState>(),
      ],
    );
  });
}
