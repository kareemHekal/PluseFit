import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/recommendation_to_day_datasource.dart';
import 'package:fit_zone/data/model/recommendation_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RecommendationToDayDataSource)
class RecommendationToDayDataSourceImpl extends RecommendationToDayDataSource {
  final ApiManager apiManager;

  RecommendationToDayDataSourceImpl(this.apiManager);
  @override
  Future<ApiResult<RecommendationResponse>> getRecommendationToDay() {
    return executeApi<RecommendationResponse>(() async {
      final response =
          await apiManager.getRequest(endpoint: EndPoint.recommendationToDay);
      return RecommendationResponse.fromJson(response.data);
    });
  }
}
