
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/exercise_by_muscle/exercise_by_muscle_response.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_excuter.dart';
import '../../core/api/endpoints.dart';
import '../data_source_contract/exercise_by_muscle_datasource.dart';
@Injectable(as: ExerciseByMuscleDatasource)
class ExerciseByMuscleDatasourceImpl extends ExerciseByMuscleDatasource {
  ApiManager apiManager;

  ExerciseByMuscleDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<ExerciseByMuscleResponse>> getExerciseByMuscle({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  }) async {
    final apiResult = await executeApi(() async {
      final response = await apiManager.getRequest(
        endpoint: EndPoint.exerciseByMuscleEndpoint(
          primeMoverMuscleId: primeMoverMuscleId,
          difficultyLevelId: difficultyLevelId,
        ),
      );
      return response.data;
    });

    if (apiResult is SuccessApiResult) {
      final json = apiResult.data; // ✅ ده الـ Map اللي المفروض تبعته
      final result = ExerciseByMuscleResponse.fromJson(json); // ✅ كده تمام
      return SuccessApiResult(result);


    } else if (apiResult is ErrorApiResult) {
      return ErrorApiResult(apiResult.exception);
    } else {
      return ErrorApiResult(Exception('Unknown error occurred during API call'));
    }
  }
}
