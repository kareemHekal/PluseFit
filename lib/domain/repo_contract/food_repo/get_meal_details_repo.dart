import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/meal_details.dart';

abstract class GetMealDetailsRepo {
  Future<ApiResult<MealDetails>> getMealDetails(String mealId);
}
