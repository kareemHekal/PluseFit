import 'package:fit_zone/data/model/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> login({required String email, required String password});
}
