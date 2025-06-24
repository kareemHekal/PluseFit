sealed class MealsIntent {}

class GetMealsByCategoryIntent extends MealsIntent {
  final String categoryId;
  GetMealsByCategoryIntent(this.categoryId);
}
