
import 'package:fit_zone/data/model/food/meal.dart';

sealed class MealsState {}

class MealsInitial extends MealsState {}

class MealsLoadingState extends MealsState {}

class MealsLoadedState extends MealsState {
  final List<Meal> meals;
  MealsLoadedState({required this.meals});
}

class MealsErrorState extends MealsState {
  final String message;
  MealsErrorState({required this.message});
}
