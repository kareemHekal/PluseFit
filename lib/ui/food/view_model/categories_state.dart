

import 'package:fit_zone/data/model/food/category.dart';

sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final List<Category> categories;
  CategoriesLoadedState({required this.categories});
}

class CategoriesErrorState extends CategoriesState {
  final String message;
  CategoriesErrorState({required this.message});
}
