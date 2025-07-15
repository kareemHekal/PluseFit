import 'package:dio/dio.dart';
import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/food_datasource/get_meal_details_datasource.dart';
import 'package:fit_zone/data/model/food/meal_details.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetMealDetailsDatasource)
class GetMealDetailsDatasourceImpl implements GetMealDetailsDatasource {
  final ApiManager apiManager;

  GetMealDetailsDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<MealDetails>> getMealDetails(String mealId) async {
    return await executeApi<MealDetails>(() async {
      Response response = await apiManager.getRequestForMeal(
        endpoint: EndPoint.getMealDetailsById,
        queryParameters: {"i": mealId},
      );

      final meal = response.data['meals'][0];
      return MealDetails.fromJson(meal);
    });
  }
}
