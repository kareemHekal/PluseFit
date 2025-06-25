import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/meal.dart';

abstract class GetMealsByCategoryDatasource {
  Future<ApiResult<List<Meal>>> getMealsByCategory(String categoryId);
}
