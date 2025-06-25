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

  setUp(() {
    mockWorkoutRepo = MockWorkoutRepo();
    useCase = FitnessUsecase(mockWorkoutRepo);
  });

  group('FitnessUsecase', () {
    test('callGroup returns SuccessApiResult when data is returned', () async {
      // Arrange
      final id = 'group123';
      final name = 'Chest';
      final groups = [
        MusclesGroup(id: '1', name: 'Chest'),
        MusclesGroup(id: '2', name: 'Back'),
      ];

      final expectedResult = SuccessApiResult<List<MusclesGroup>>(groups);
      provideDummy<ApiResult<List<MusclesGroup>>>(expectedResult);

      when(mockWorkoutRepo.getAllGroupWorkout(id: id, name: name))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await useCase.callGroup(id: id, name: name);

      // Assert
      expect(result, expectedResult);
      verify(mockWorkoutRepo.getAllGroupWorkout(id: id, name: name)).called(1);
    });

    test('callMuscles returns SuccessApiResult when muscles are returned', () async {
      // Arrange
      final cardId = 'card123';
      final muscles = [
        Muscles(id: '1', name: 'Push Up'),
        Muscles(id: '2', name: 'Pull Up'),
      ];

      final expectedResult = SuccessApiResult<List<Muscles>>(muscles);
      provideDummy<ApiResult<List<Muscles>>>(expectedResult);

      when(mockWorkoutRepo.getAllWorkout(cardId))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await useCase.callMuscles(cardId);

      // Assert
      expect(result, expectedResult);
      verify(mockWorkoutRepo.getAllWorkout(cardId)).called(1);
    });

    test('callMuscles returns ErrorApiResult when cardId is empty', () async {
      // Act
      final result = await useCase.callMuscles('');

      // Assert
      expect(result, isA<ErrorApiResult<List<Muscles>>>());
      expect((result as ErrorApiResult).exception.toString(),
          contains("Category ID must not be empty"));
    });

    test('callMuscles returns ErrorApiResult when exception occurs', () async {
      // Arrange
      final cardId = 'card123';
      final exception = Exception('Server error');

      when(mockWorkoutRepo.getAllWorkout(cardId)).thenThrow(exception);

      // Act
      final result = await useCase.callMuscles(cardId);

      // Assert
      expect(result, isA<ErrorApiResult<List<Muscles>>>());
      expect((result as ErrorApiResult).exception.toString(),
          contains("An unexpected error occurred"));
    });
  });
}
