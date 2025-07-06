class EndPoint {
  static const String registerEndpoint = '/api/v1/auth/signup';
  static const String loginEndpoint = '/api/v1/auth/signin';
  static const String changePasswordEndpoint = "/api/v1/auth/change-password";

  static const String forgetPasswordEndpoint = "/api/v1/auth/forgotPassword";
  static const String verifyResetCode = "/api/v1/auth/verifyResetCode";
  static const String resetPassword = "/api/v1/auth/resetPassword";
  static const String editProfile = "/api/v1/auth/editProfile";
  static const String uploadProfilePhoto = "/api/v1/auth/upload-photo";

  static const String recommendationToDay = "/api/v1/muscles/random";
  static const String musclesGroup = "/api/v1/muscles";
  static const String workoutsByMuscleGroup =
      "/api/v1/musclesGroup/by-muscle-group";


  /////    Meals     //////
  static const String getCategoriesOfMeals = "/v1/1/categories.php";
  static const String getMealsByCategory = "/v1/1/filter.php";
  static const String getMealDetailsById = "/v1/1/lookup.php";
  static const String workoutTapEndpoint = "/api/v1/muscles";
  static const String workoutCardEndpoint='/api/v1/muscles/random';
}
