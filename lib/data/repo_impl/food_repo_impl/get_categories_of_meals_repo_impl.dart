
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/category.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repo_contract/food_repo/get_categories_of_meals_repo.dart';
import '../../data_source_contract/food_datasource/get_categories_of_meals_datasource.dart';

@Injectable(as: GetCategoriesOfMealsRepo)
class GetCategoriesOfMealsRepoImpl implements GetCategoriesOfMealsRepo {
  final GetCategoriesOfMealsDatasource getCategoriesOfMealsDatasource;

  GetCategoriesOfMealsRepoImpl(this.getCategoriesOfMealsDatasource);

  @override
  Future<ApiResult<List<Category>>> getCategoriesOfMeals() {
    return getCategoriesOfMealsDatasource.getCategoriesOfMeals();
  }
}
