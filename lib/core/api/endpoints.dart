class EndPoint {
  static const String registerEndpoint = '/api/v1/auth/signup';
  static const String loginEndpoint = '/api/v1/auth/signin';

  static const String forgetPasswordEndpoint = "/v1/auth/forgotPassword";
  static const String verifyResetCode = "/v1/auth/verifyResetCode";
  static const String resetPassword = "/v1/auth/resetPassword";

  static const String recommendationToDay = "/api/v1/muscles/random";
  static const String musclesGroup = "/api/v1/muscles";
  static const String workoutsByMuscleGroup =
      "/api/v1/musclesGroup/by-muscle-group";



  /////    Meals     //////
  static const String getCategoriesOfMeals = "/v1/1/categories.php";
  static const String getMealsByCategory = "/v1/1/filter.php";

}
