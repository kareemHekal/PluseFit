import 'package:dartz/dartz.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/workouts_datasource.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/entity/error_model.dart';
import 'package:fit_zone/domain/entity/workouts_entity.dart';
import 'package:fit_zone/domain/repo_contract/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutsRepo)
class WorkoutsRepoImpl extends WorkoutsRepo {
  final WorkoutsDataSource dataSource;

  WorkoutsRepoImpl(this.dataSource);

  @override
  Future<Either<ServerError, List<MuscleGroupEntity>>>
      getMusclesGroups() async {
    var apiResult = await dataSource.getMusclesGroups();

    switch (apiResult) {
      case SuccessApiResult(data: final response):
        {
          final englishNames = {
            "عضلات البطن": "Stomach",
            "عضلات الأرداف": "Glutes",
            "عضلات الصدر": "Chest",
            "عضلات الكتف": "Shoulder",
            "عضلات الظهر": "Back",
            "العضلة الضامة": "Adductors",
            "العضلة ذات الرأسين": "Biceps",
            "عضلة الفخذ الرباعية": "Quadriceps",
            "أوتار الركبة": "Hamstrings",
            "المبعدون": "Abductors",
            "شبه المنحرفة": "Trapezius",
            "العضلة ثلاثية الرؤوس": "Triceps",
            "الساعد": "Forearms",
            "السمانة": "Calves",
            " عضلة الظنبوب الأمامية": "Shins",
            "العضلات القابضة في الفخذ": "Hip Flexors",
          };

          var muscles = response?.musclesGroup
                  ?.map((e) => MuscleGroupEntity(
                        id: e.sId,
                        name: englishNames[e.name] ?? e.name ?? "Unknown",
                      ))
                  .toList() ??
              [];
          return Right(muscles);
        }
      case ErrorApiResult(exception: final exception):
        {
          if (exception is ServerError) {
            return Left(exception);
          }
          return Left(ServerError(
              errorModel: ErrorModel(message: "Something went wrong")));
        }
    }
  }

  @override
  Future<Either<ServerError, List<WorkoutEntity>>> getWorkoutsByMuscleGroupId(
      String muscleGroupId) async {
    var apiResult = await dataSource.getWorkoutsByMuscleGroupId(muscleGroupId);

    switch (apiResult) {
      case SuccessApiResult(data: final response):
        {
          var workouts =
              response?.muscles?.map((e) => e.toEntity()).toList() ?? [];
          return Right(workouts);
        }
      case ErrorApiResult(exception: final exception):
        {
          if (exception is ServerError) {
            return Left(exception);
          }
          return Left(ServerError(
              errorModel: ErrorModel(message: "Something went wrong")));
        }
    }
  }
}
