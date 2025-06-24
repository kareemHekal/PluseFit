import 'package:fit_zone/data/model/food/meal.dart';
import '../../../core/api/api_result.dart';

abstract class GetMealsByCategoryRepo {
  Future<ApiResult<List<Meal>>> getMealsByCategory(String categoryId);
}
