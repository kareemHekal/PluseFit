import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/domain/repo_contract/workout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FitnessUsecase {
  final WorkoutRepo workoutRepo;

  FitnessUsecase(this.workoutRepo);

  Future<ApiResult<List<MusclesGroup>>> call({
    required String id,
    required String name,
  }) async {
    return await workoutRepo.getAllGroupWorkout(id: id, name: name);
  }

  Future<ApiResult<List<Muscles>>> execute(String cardId) async {
    if (cardId.trim().isEmpty) {
      return execute("Category ID must not be empty");
    }
    try {
      final result = await workoutRepo.getAllWorkout(cardId);
      return result;
    } catch (e, stack) {
      return execute("An unexpected error occurred");
    }
  }
}
