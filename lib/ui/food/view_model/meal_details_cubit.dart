import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/meal.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/use_cases/food_usecase/get_meal_details_usecase.dart';
import 'package:fit_zone/domain/use_cases/food_usecase/get_meals_by_category_usecase.dart';
import 'package:fit_zone/ui/food/view_model/meal_details_intent.dart';
import 'package:fit_zone/ui/food/view_model/meal_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MealDetailsCubit extends Cubit<MealDetailsState> {
  final GetMealDetailsUsecase getMealDetailsUsecase;
  final GetMealsByCategoryUsecase getMealsByCategoryUsecase;

  MealDetailsCubit(this.getMealDetailsUsecase, this.getMealsByCategoryUsecase)
      : super(MealDetailsInitial());

  void doIntent(MealDetailsIntent intent) {
    switch (intent) {
      case GetMealDetailsIntent():
        _getMealDetails(intent.mealId);
    }
  }

  void _getMealDetails(String mealId) async {
    emit(MealDetailsLoading());
    final result = await getMealDetailsUsecase.call(mealId);
    switch (result) {
      case SuccessApiResult(:final data):
        final mealDetails = data!;
        final recommendationsResult =
            await getMealsByCategoryUsecase.execute(mealDetails.strCategory);

        switch (recommendationsResult) {
          case SuccessApiResult<List<Meal>>(:final data):
            final recommendations = data!
                .where((meal) => meal.idMeal != mealDetails.idMeal)
                .toList();
            recommendations.shuffle();
            emit(MealDetailsLoaded(
                mealDetails, recommendations.take(4).toList()));
            break;
          case ErrorApiResult():
            // If fetching recommendations fails, emit state with empty list
            emit(MealDetailsLoaded(mealDetails, []));
            break;
        }

        break;
      case ErrorApiResult(:final exception):
        switch (exception) {
          case ServerError():
            emit(MealDetailsError(
                exception.errorModel?.message ?? "Server Error"));
            break;
          default:
            emit(MealDetailsError(exception.toString()));
            break;
        }
    }
  }
}
