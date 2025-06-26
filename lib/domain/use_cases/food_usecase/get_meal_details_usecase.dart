import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/meal_details.dart';
import 'package:fit_zone/domain/repo_contract/food_repo/get_meal_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealDetailsUsecase {
  final GetMealDetailsRepo repo;

  GetMealDetailsUsecase(this.repo);

  Future<ApiResult<MealDetails>> call(String mealId) {
    return repo.getMealDetails(mealId);
  }
}
