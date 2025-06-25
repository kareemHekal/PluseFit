
import 'package:bloc/bloc.dart';
import 'package:fit_zone/ui/food/view_model/categories_intent.dart';
import 'package:fit_zone/ui/food/view_model/categories_state.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../domain/use_cases/food_usecase/get_categories_of_meals_usecase.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  @factoryMethod
  final GetCategoriesOfMealsUsecase getCategoriesOfMealsUsecase;

  CategoriesCubit(this.getCategoriesOfMealsUsecase) : super(CategoriesInitial());

  Future<void> _getCategoriesOfMeals() async {
    emit(CategoriesLoadingState());
    final result = await getCategoriesOfMealsUsecase.execute();

    switch (result) {
      case SuccessApiResult():
        emit(CategoriesLoadedState(categories: result.data ?? []));
      case ErrorApiResult():
        emit(CategoriesErrorState(message: result.exception.toString()));
    }
  }

  void doIntent(CategoriesIntent intent) {
    switch (intent) {
      case GetCategoriesOfMealsIntent():
        _getCategoriesOfMeals();
        break;
    }
  }
}