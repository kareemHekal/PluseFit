import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/auth/workout_datasource.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/data/model/workout_response/workout_card_response.dart';
import 'package:fit_zone/data/model/workout_response/workout_group_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutDatasource)
class WorkoutDatasourceImpl implements WorkoutDatasource {
  final ApiManager apiManager;

  WorkoutDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<MusclesGroup>>> getAllGroupWorkout({
    required String id,
    required String name,
  }) async {
    var response = await apiManager.getRequest(
      endpoint: EndPoint.workoutTapEndpoint,
    );

    final groupWorkoutResponsedart =
        WorkoutGroupResponse.fromJson(response.data);

    final musclesGroup = groupWorkoutResponsedart.musclesGroup;

    if (musclesGroup != null && musclesGroup.isNotEmpty) {
      return SuccessApiResult(musclesGroup.cast<MusclesGroup>());
    } else {
      return ErrorApiResult(Exception("No matching categories found"));
    }
  }

  @override
  Future<ApiResult<List<Muscles>>> getAllWorkout(String cardId) async {
    var response = await apiManager.getRequest(
      endpoint: EndPoint.workoutCardEndpoint,
    );

    final workoutCardResponsedart = WorkoutCardResponse.fromJson(response.data);

    final muscles = workoutCardResponsedart.muscles;

    if (muscles != null && muscles.isNotEmpty) {
      return SuccessApiResult(muscles.cast<Muscles>());
    } else {
      return ErrorApiResult(Exception("No matching categories found"));
    }
  }
}
