import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data/model/food/category.dart';
import '../../repo_contract/food_repo/get_categories_of_meals_repo.dart';


@injectable
class GetCategoriesOfMealsUsecase {
  final GetCategoriesOfMealsRepo getCategoriesOfMealsRepo;

  GetCategoriesOfMealsUsecase(this.getCategoriesOfMealsRepo);

  Future<ApiResult<List<Category>>> execute() =>
      getCategoriesOfMealsRepo.getCategoriesOfMeals();
}
