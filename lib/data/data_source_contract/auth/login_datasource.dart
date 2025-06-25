import 'package:fit_zone/data/model/register_response/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> login({required String email, required String password});
}
