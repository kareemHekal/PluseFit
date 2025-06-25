import 'package:fit_zone/data/model/food/category.dart';
import '../../../core/api/api_result.dart';

abstract class GetCategoriesOfMealsRepo {
  Future<ApiResult<List<Category>>> getCategoriesOfMeals();
}
