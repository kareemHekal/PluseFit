
// ignore: implementation_imports
import 'package:dio/src/response.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/category.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_excuter.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/api/endpoints.dart';
import '../../data_source_contract/food_datasource/get_categories_of_meals_datasource.dart';

@Injectable(as: GetCategoriesOfMealsDatasource)
class GetCategoriesOfMealsDatasourceImpl implements GetCategoriesOfMealsDatasource {
  final ApiManager apiManager;

  GetCategoriesOfMealsDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<Category>>> getCategoriesOfMeals() async {
    return await executeApi<List<Category>>(() async {
      Response response = await apiManager.getRequestForMeal(
          endpoint: EndPoint.getCategoriesOfMeals,
        );

      final categories = response.data['categories'] as List;
      return categories.map((e) => Category.fromJson(e)).toList();
    });
  }
}
