import 'package:fit_zone/data/login_datasource.dart';
import 'package:fit_zone/domain/common/login_repo.dart';
import 'package:fit_zone/data/model/user_model.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final LoginDataSource loginDataSource;
  AuthRepositoryImpl(this.loginDataSource);

  @override
  Future<UserModel> login({required String email, required String password}) {
    return loginDataSource.login(email: email, password: password);
  }
}
