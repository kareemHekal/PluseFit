import 'package:fit_zone/domain/repo_contract/exercise_by_muscle_repo.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_result.dart';
import '../../data/model/exercise_by_muscle/exercise_by_muscle_response.dart';

@injectable
class ExerciseByMuscleUsecase{
  ExerciseByMuscleRepo exerciseByMuscleRepo;
  ExerciseByMuscleUsecase(this.exerciseByMuscleRepo);

  Future<ApiResult<ExerciseByMuscleResponse>> call({required String primeMoverMuscleId, required String difficultyLevelId})async{
   return await exerciseByMuscleRepo.getExerciseByMuscle(primeMoverMuscleId: primeMoverMuscleId, difficultyLevelId: difficultyLevelId);
  }


}