import 'package:fit_zone/data/model/login_responce.dart';

abstract class LoginRepo {
  Future<LoginResponse> login(
      {required String email, required String password});
}
