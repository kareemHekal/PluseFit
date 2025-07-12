import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fit_zone/domain/repo_contract/exercise_by_muscle_repo.dart';
import 'package:fit_zone/domain/use_cases/exercise_by_muscle_usecase.dart';
import 'package:fit_zone/data/model/exercise_by_muscle/exercise_by_muscle_response.dart';
import 'package:fit_zone/core/api/api_result.dart';

import 'exercise_by_muscle_usecase_test.mocks.dart';

@GenerateMocks([ExerciseByMuscleRepo])
void main() {
  late MockExerciseByMuscleRepo mockExerciseByMuscleRepo;
  late ExerciseByMuscleUsecase useCase;

  // حل مشكلة MissingDummyValueError
  provideDummy<ApiResult<ExerciseByMuscleResponse>>(
    SuccessApiResult(
      ExerciseByMuscleResponse(
        message: "dummy",
        totalExercises: 0,
        exercises: [],
      ),
    ),
  );

  setUp(() {
    mockExerciseByMuscleRepo = MockExerciseByMuscleRepo();
    useCase = ExerciseByMuscleUsecase(mockExerciseByMuscleRepo);
  });

  group('ExerciseByMuscleUsecase', () {
    test('should return exercise list when repository returns data', () async {
      // Arrange
      const primeMoverMuscleId = "67c8499726895f87ce0aa9c2";
      const difficultyLevelId = "67c797e226895f87ce0aa94b";

      final response = ExerciseByMuscleResponse(
        message: "success",
        totalExercises: 1,
        exercises: [

        ],
      );

      final expectedResult = SuccessApiResult<ExerciseByMuscleResponse>(response);

      when(mockExerciseByMuscleRepo.getExerciseByMuscle(
        primeMoverMuscleId: primeMoverMuscleId,
        difficultyLevelId: difficultyLevelId,
      )).thenAnswer((_) async => expectedResult);

      // Act
      final result = await useCase.call(
        primeMoverMuscleId: primeMoverMuscleId,
        difficultyLevelId: difficultyLevelId,
      );

      // Assert
      expect(result, expectedResult);
      verify(mockExerciseByMuscleRepo.getExerciseByMuscle(
        primeMoverMuscleId: primeMoverMuscleId,
        difficultyLevelId: difficultyLevelId,
      )).called(1);
    });
  });
}
