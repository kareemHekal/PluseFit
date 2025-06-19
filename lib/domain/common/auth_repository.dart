import '../../data/model/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login({required String email, required String password});
}
