
import '../../core/api/api_result.dart';
import '../model/exercise_by_muscle/exercise_by_muscle_response.dart';

abstract class ExerciseByMuscleDatasource{
  Future<ApiResult<ExerciseByMuscleResponse>> getExerciseByMuscle({required String primeMoverMuscleId,required String difficultyLevelId});

}