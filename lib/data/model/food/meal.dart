class Meal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
      idMeal: json['idMeal'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'idMeal': idMeal,
    };
  }
}
