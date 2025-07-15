sealed class MealDetailsIntent {}

class GetMealDetailsIntent extends MealDetailsIntent {
  final String mealId;
  GetMealDetailsIntent(this.mealId);
}
