abstract class Constant {
  static const String tokenKey = 'auth_token';
  static const String userName = 'userName';
  static const String highestPrice = 'HighestPrice';
  static const String lowestPrice = 'LowestPrice';
  static const String isRememberMe = 'isRememberMe';
  static const String baseUrl = "https://fitness.elevateegy.com";
  static const String regExValidateEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static RegExp regexPass = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
  );

  static const String lastConversationIdKey = 'last_conversation_id';

  static const Duration connectTimeout = Duration(seconds: 40);

  static const String mealBaseUrl = "https://www.themealdb.com/api/json";

}
