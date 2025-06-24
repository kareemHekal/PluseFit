import 'package:fit_zone/data/model/food/meal.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_result.dart';
import '../../repo_contract/food_repo/get_meals_by_category_repo.dart';


@injectable
class GetMealsByCategoryUsecase {
  final GetMealsByCategoryRepo getMealsByCategoryRepo;

  GetMealsByCategoryUsecase(this.getMealsByCategoryRepo);

  Future<ApiResult<List<Meal>>> execute(String categoryId) =>
      getMealsByCategoryRepo.getMealsByCategory(categoryId);
}
