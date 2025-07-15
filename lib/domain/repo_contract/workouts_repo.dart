import 'package:dartz/dartz.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/entity/workouts_entity.dart';

abstract class WorkoutsRepo {
  Future<Either<ServerError, List<MuscleGroupEntity>>> getMusclesGroups();
  Future<Either<ServerError, List<WorkoutEntity>>> getWorkoutsByMuscleGroupId(
      String muscleGroupId);
}
