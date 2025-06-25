import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/domain/repo_contract/workout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FitnessUsecase {
  final WorkoutRepo workoutRepo;

  FitnessUsecase(this.workoutRepo);

  Future<ApiResult<List<MusclesGroup>>> callGroup({
    required String id,
    required String name,
  }) async {
    return await workoutRepo.getAllGroupWorkout(id: id, name: name);
  }

  Future<ApiResult<List<Muscles>>> callMuscles(String cardId) async {
    return await workoutRepo.getAllWorkout(cardId);
  }
}
