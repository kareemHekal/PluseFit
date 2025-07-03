import 'package:fit_zone/data/model/login_responce.dart';

abstract class LoginDataSource {
  Future<LoginResponse> login(
      {required String email, required String password});
}
