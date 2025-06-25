import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/recommendation_response.dart';

abstract class RecommendationToDayDataSource {
  Future<ApiResult<RecommendationResponse>> getRecommendationToDay();
}
