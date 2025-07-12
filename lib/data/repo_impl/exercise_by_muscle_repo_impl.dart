import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/exercise_by_muscle_datasource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repo_contract/exercise_by_muscle_repo.dart';
import '../model/exercise_by_muscle/exercise_by_muscle_response.dart';

@Injectable(as: ExerciseByMuscleRepo)
class ExerciseByMuscleRepoImpl extends  ExerciseByMuscleRepo{
  ExerciseByMuscleDatasource exerciseByMuscleDatasource;
  ExerciseByMuscleRepoImpl(this.exerciseByMuscleDatasource);

  @override
  Future<ApiResult<ExerciseByMuscleResponse>> getExerciseByMuscle({required String primeMoverMuscleId, required String difficultyLevelId}) async{
    return await exerciseByMuscleDatasource.getExerciseByMuscle(primeMoverMuscleId: primeMoverMuscleId, difficultyLevelId: difficultyLevelId);
  }


 }