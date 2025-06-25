import 'package:dartz/dartz.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/entity/workouts_entity.dart';
import 'package:fit_zone/domain/repo_contract/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWorkoutsByMuscleGroupIdUseCase {
  final WorkoutsRepo repo;

  GetWorkoutsByMuscleGroupIdUseCase(this.repo);

  Future<Either<ServerError, List<WorkoutEntity>>> execute(
      String muscleGroupId) {
    return repo.getWorkoutsByMuscleGroupId(muscleGroupId);
  }
}
