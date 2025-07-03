import 'package:fit_zone/data/data_source_contract/auth/login_datasource.dart';
import 'package:fit_zone/data/model/login_responce.dart';
import 'package:fit_zone/domain/repo_contract/login_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginDataSource loginDataSource;
  LoginRepoImpl(this.loginDataSource);

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) {
    return loginDataSource.login(email: email, password: password);
  }
}
