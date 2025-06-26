import 'package:fit_zone/data/model/food/meal.dart';
import 'package:fit_zone/data/model/food/meal_details.dart';

sealed class MealDetailsState {}

class MealDetailsInitial extends MealDetailsState {}

class MealDetailsLoading extends MealDetailsState {}

class MealDetailsLoaded extends MealDetailsState {
  final MealDetails mealDetails;
  final List<Meal> recommendations;
  MealDetailsLoaded(this.mealDetails, this.recommendations);
}

class MealDetailsError extends MealDetailsState {
  final String message;
  MealDetailsError(this.message);
}
