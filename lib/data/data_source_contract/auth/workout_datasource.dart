import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';

abstract class WorkoutDatasource {
  Future<ApiResult<List<MusclesGroup>>> getAllGroupWorkout({
    required String id,
    required String name,
  });

  Future<ApiResult<List<Muscles>>> getAllWorkout(String cardId);
}
