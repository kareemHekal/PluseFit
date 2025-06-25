import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/domain/repo_contract/workout_repo.dart';
import 'package:fit_zone/domain/use_cases/fitness_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fitness_usecase_test.mocks.dart';

@GenerateMocks([WorkoutRepo])
void main() {
  late MockWorkoutRepo mockWorkoutRepo;
  late FitnessUsecase useCase;

  setUpAll(() {
    mockWorkoutRepo = MockWorkoutRepo();
    useCase = FitnessUsecase(mockWorkoutRepo);
  });

  group('FitnessUsecase', () {
    test('callGroup returns success result from WorkoutRepo', () async {
      // Arrange
      final id = 'group123';
      final name = 'Chest';
      final musclesGroupList = [
        MusclesGroup(id: '1', name: 'Chest'),
        MusclesGroup(id: '2', name: 'Back'),
      ];
      final expectedResult = SuccessApiResult<List<MusclesGroup>>(musclesGroupList);

      provideDummy<ApiResult<List<MusclesGroup>>>(expectedResult);

      when(mockWorkoutRepo.getAllGroupWorkout(id: id, name: name))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await useCase.callGroup(id: id, name: name);

      // Assert
      verify(mockWorkoutRepo.getAllGroupWorkout(id: id, name: name)).called(1);
      expect(result, expectedResult);
    });

    test('callMuscles returns success result from WorkoutRepo', () async {
      // Arrange
      final cardId = 'card123';
      final musclesList = [
        Muscles(id: '1', name: 'Push Up'),
        Muscles(id: '2', name: 'Pull Up'),
      ];
      final expectedResult = SuccessApiResult<List<Muscles>>(musclesList);

      provideDummy<ApiResult<List<Muscles>>>(expectedResult);

      when(mockWorkoutRepo.getAllWorkout(cardId))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await useCase.callMuscles(cardId);

      // Assert
      verify(mockWorkoutRepo.getAllWorkout(cardId)).called(1);
      expect(result, expectedResult);
    });
  });
}
