import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/auth/workout_datasource.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/domain/repo_contract/workout_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutRepo)
class WorkoutRepoImpl implements WorkoutRepo {
  final WorkoutDatasource workoutDatasource;

  WorkoutRepoImpl(this.workoutDatasource);

  @override
  Future<ApiResult<List<MusclesGroup>>> getAllGroupWorkout({
    required String id,
    required String name,
  }) async {
    final result =
        await workoutDatasource.getAllGroupWorkout(id: id, name: name);
    if (result is SuccessApiResult<List<MusclesGroup>>) {
      final fetchedGroups = result.data;
      if (fetchedGroups == null || fetchedGroups.isEmpty) {
        return ErrorApiResult(
            Exception("No matching MusclesGroup found for id=$id, name=$name"));
      }
      final mappedGroups = fetchedGroups.map((group) {
        return MusclesGroup(
          id: group.id ?? '',
          name: group.name ?? '',
        );
      }).toList();
      return SuccessApiResult(mappedGroups);
    }
    if (result is ErrorApiResult<List<MusclesGroup>>) {
      return ErrorApiResult(result.exception);
    }
    return ErrorApiResult(Exception("Unknown error occurred"));
  }

  @override
  Future<ApiResult<List<Muscles>>> getAllWorkout(String cardId) {
    return workoutDatasource.getAllWorkout(cardId);
  }
}
