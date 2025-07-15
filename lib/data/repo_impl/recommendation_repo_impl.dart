import 'package:dartz/dartz.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/recommendation_to_day_datasource.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/entity/error_model.dart';
import 'package:fit_zone/domain/entity/recommendation_entity.dart';
import 'package:fit_zone/domain/repo_contract/recommendation_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RecommendationRepo)
class RecommendationRepoImpl implements RecommendationRepo {
  final RecommendationToDayDataSource dataSource;

  RecommendationRepoImpl(this.dataSource);
  @override
  Future<Either<ServerError, List<MuscleEntity>>>
      getRecommendationToDay() async {
    var apiResult = await dataSource.getRecommendationToDay();

    switch (apiResult) {
      case SuccessApiResult(data: final response):
        {
          var muscles =
              response?.muscles?.map((e) => e.toEntity()).toList() ?? [];
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
}
