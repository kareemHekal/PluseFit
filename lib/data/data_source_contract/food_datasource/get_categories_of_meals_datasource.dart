import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/category.dart';

abstract class GetCategoriesOfMealsDatasource {
  Future<ApiResult<List<Category>>> getCategoriesOfMeals();
}
