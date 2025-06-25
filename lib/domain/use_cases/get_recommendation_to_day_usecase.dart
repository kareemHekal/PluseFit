import 'package:dartz/dartz.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/entity/recommendation_entity.dart';
import 'package:fit_zone/domain/repo_contract/recommendation_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecommendationToDayUseCase {
  final RecommendationRepo repo;

  GetRecommendationToDayUseCase(this.repo);

  Future<Either<ServerError, List<MuscleEntity>>> execute() {
    return repo.getRecommendationToDay();
  }
}
