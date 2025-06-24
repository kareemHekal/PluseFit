import 'package:fit_zone/ui/food/view_model/meals_intent.dart';
import 'package:fit_zone/ui/food/view_model/meals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_result.dart';
import '../../../domain/use_cases/food_usecase/get_meals_by_category_usecase.dart';

@injectable
class MealsCubit extends Cubit<MealsState> {
  @factoryMethod
  final GetMealsByCategoryUsecase getMealsByCategoryUsecase;

  MealsCubit(this.getMealsByCategoryUsecase) : super(MealsInitial());

  Future<void> _getMealsByCategory(String categoryId) async {
    emit(MealsLoadingState());
    final result = await getMealsByCategoryUsecase.execute(categoryId);

    switch (result) {
      case SuccessApiResult():
        emit(MealsLoadedState(meals: result.data ?? []));
      case ErrorApiResult():
        emit(MealsErrorState(message: result.exception.toString()));
    }
  }

  void doIntent(MealsIntent intent) {
    switch (intent) {
      case GetMealsByCategoryIntent():
        _getMealsByCategory(intent.categoryId);
        break;
    }
  }
}