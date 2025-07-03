import 'package:dartz/dartz.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/entity/recommendation_entity.dart';

abstract class RecommendationRepo {
  Future<Either<ServerError, List<MuscleEntity>>> getRecommendationToDay();
}
