// ignore_for_file: implementation_imports

import 'package:dio/src/response.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/meal.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_excuter.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/api/endpoints.dart';
import '../../data_source_contract/food_datasource/get_meals_by_category_datasource.dart';


@Injectable(as: GetMealsByCategoryDatasource)
class GetMealsByCategoryDatasourceImpl implements GetMealsByCategoryDatasource {
  final ApiManager apiManager;

  GetMealsByCategoryDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<Meal>>> getMealsByCategory(
      String categoryId) async {
    return await executeApi<List<Meal>>(() async {
      Response response = await apiManager.getRequestForMeal(
            endpoint: EndPoint.getMealsByCategory,
            queryParameters: {"c": categoryId});

      final meals = response.data['meals'] as List;
      return meals.map((e) => Meal.fromJson(e)).toList();
    });
  }
}
