import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/auth/workout_datasource.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/data/repo_impl/workout_repo_impl.dart';
import 'package:fit_zone/domain/repo_contract/workout_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'workout_repo_impl_test.mocks.dart';

@GenerateMocks([WorkoutDatasource])
void main() {
  late MockWorkoutDatasource mockWorkoutDatasource;
  late WorkoutRepo workoutRepo;

  setUp(() {
    mockWorkoutDatasource = MockWorkoutDatasource();
    workoutRepo = WorkoutRepoImpl(mockWorkoutDatasource);
  });

  group('WorkoutRepoImpl', () {
    test('getAllGroupWorkout returns mapped SuccessApiResult<List<MusclesGroup>>', () async {
      // Arrange
      final id = "1";
      final name = "Test";
      final rawGroups = [
        MusclesGroup(id: "1", name: "Chest"),
        MusclesGroup(id: "2", name: "Back"),
      ];

      final apiResult = SuccessApiResult<List<MusclesGroup>>(rawGroups);
      provideDummy<ApiResult<List<MusclesGroup>>>(apiResult);

      when(mockWorkoutDatasource.getAllGroupWorkout(id: id, name: name))
          .thenAnswer((_) async => apiResult);

      // Act
      final result = await workoutRepo.getAllGroupWorkout(id: id, name: name);

      // Assert
      expect(result, isA<SuccessApiResult<List<MusclesGroup>>>());
      final groups = (result as SuccessApiResult<List<MusclesGroup>>).data!;
      expect(groups.length, 2);
      expect(groups.first.name, "Chest");
      verify(mockWorkoutDatasource.getAllGroupWorkout(id: id, name: name)).called(1);
    });

    test('getAllGroupWorkout returns ErrorApiResult if empty', () async {
      // Arrange
      final id = "1";
      final name = "Test";

      final emptyResult = SuccessApiResult<List<MusclesGroup>>([]);
      provideDummy<ApiResult<List<MusclesGroup>>>(emptyResult);

      when(mockWorkoutDatasource.getAllGroupWorkout(id: id, name: name))
          .thenAnswer((_) async => emptyResult);

      // Act
      final result = await workoutRepo.getAllGroupWorkout(id: id, name: name);

      // Assert
      expect(result, isA<ErrorApiResult<List<MusclesGroup>>>());
    });

    test('getAllWorkout returns SuccessApiResult<List<Muscles>>', () async {
      // Arrange
      final cardId = "card123";
      final muscles = [
        Muscles(id: "1", name: "Push Up"),
        Muscles(id: "2", name: "Pull Up"),
      ];

      final successResult = SuccessApiResult<List<Muscles>>(muscles);
      provideDummy<ApiResult<List<Muscles>>>(successResult);

      when(mockWorkoutDatasource.getAllWorkout(cardId))
          .thenAnswer((_) async => successResult);

      // Act
      final result = await workoutRepo.getAllWorkout(cardId);

      // Assert
      expect(result, isA<SuccessApiResult<List<Muscles>>>());
      final data = (result as SuccessApiResult<List<Muscles>>).data!;
      expect(data.length, 2);
      expect(data.first.name, "Push Up");
      verify(mockWorkoutDatasource.getAllWorkout(cardId)).called(1);
    });
  });
}
