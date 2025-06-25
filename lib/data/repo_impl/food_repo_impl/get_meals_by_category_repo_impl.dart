
import 'package:fit_zone/data/model/food/meal.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_result.dart';
import '../../../domain/repo_contract/food_repo/get_meals_by_category_repo.dart';
import '../../data_source_contract/food_datasource/get_meals_by_category_datasource.dart';

@Injectable(as: GetMealsByCategoryRepo)
class GetMealsByCategoryRepoImpl implements GetMealsByCategoryRepo {
  final GetMealsByCategoryDatasource getMealsByCategoryDatasource;

  GetMealsByCategoryRepoImpl(this.getMealsByCategoryDatasource);

  @override
  Future<ApiResult<List<Meal>>> getMealsByCategory(String categoryId) {
    return getMealsByCategoryDatasource.getMealsByCategory(categoryId);
  }
}
