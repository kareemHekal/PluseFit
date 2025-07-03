class EndPoint {
  static const String registerEndpoint = '/api/v1/auth/signup';

  static const String forgetPasswordEndpoint = "/api/v1/auth/forgotPassword";
  static const String verifyResetCode = "/api/v1/auth/verifyResetCode";
  static const String resetPassword = "/api/v1/auth/resetPassword";

  ///exersise

  static String getMuscleById({required String muscleId}){
    return "/api/v1/musclesGroup/$muscleId";
  }
  static const String getAllLevel = "/api/v1/levels";
   static  String exerciseByMuscleEndpoint ({required String primeMoverMuscleId,required String difficultyLevelId}){
    return "/api/v1/exercises/by-muscle-difficulty?primeMoverMuscleId=$primeMoverMuscleId&difficultyLevelId=$difficultyLevelId";
  }

}
