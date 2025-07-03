import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/muscles_group_response.dart';
import 'package:fit_zone/data/model/workouts_by_muscle_group_response.dart';

abstract class WorkoutsDataSource {
  Future<ApiResult<MusclesGroupResponse>> getMusclesGroups();
  Future<ApiResult<WorkoutsByMuscleGroupResponse>> getWorkoutsByMuscleGroupId(
      String muscleGroupId);
}
