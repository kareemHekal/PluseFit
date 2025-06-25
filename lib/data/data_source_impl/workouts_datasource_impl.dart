import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/workouts_datasource.dart';
import 'package:fit_zone/data/model/muscles_group_response.dart';
import 'package:fit_zone/data/model/workouts_by_muscle_group_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutsDataSource)
class WorkoutsDataSourceImpl extends WorkoutsDataSource {
  final ApiManager apiManager;

  WorkoutsDataSourceImpl(this.apiManager);

  @override
  Future<ApiResult<MusclesGroupResponse>> getMusclesGroups() {
    return executeApi<MusclesGroupResponse>(
      () async {
        final response = await apiManager.getRequest(
          endpoint: EndPoint.musclesGroup,
        );
        return MusclesGroupResponse.fromJson(response.data);
      },
    );
  }

  @override
  Future<ApiResult<WorkoutsByMuscleGroupResponse>> getWorkoutsByMuscleGroupId(
      String muscleGroupId) {
    return executeApi<WorkoutsByMuscleGroupResponse>(
      () async {
        final response = await apiManager.getRequest(
          endpoint: EndPoint.workoutsByMuscleGroup,
          queryParameters: {'muscleGroupId': muscleGroupId},
        );
        return WorkoutsByMuscleGroupResponse.fromJson(response.data);
      },
    );
  }
}
