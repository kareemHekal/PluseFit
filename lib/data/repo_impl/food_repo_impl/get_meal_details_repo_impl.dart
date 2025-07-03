import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/food_datasource/get_meal_details_datasource.dart';
import 'package:fit_zone/data/model/food/meal_details.dart';
import 'package:fit_zone/domain/repo_contract/food_repo/get_meal_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetMealDetailsRepo)
class GetMealDetailsRepoImpl implements GetMealDetailsRepo {
  final GetMealDetailsDatasource datasource;

  GetMealDetailsRepoImpl(this.datasource);

  @override
  Future<ApiResult<MealDetails>> getMealDetails(String mealId) {
    return datasource.getMealDetails(mealId);
  }
}
