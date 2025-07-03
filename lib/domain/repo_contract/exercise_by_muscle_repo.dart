import '../../core/api/api_result.dart';
import '../../data/model/exercise_by_muscle/exercise_by_muscle_response.dart';

abstract class ExerciseByMuscleRepo{
  Future<ApiResult<ExerciseByMuscleResponse>> getExerciseByMuscle({
     required String primeMoverMuscleId,
     required String difficultyLevelId,
   });
 }