import 'package:fit_zone/data/model/login_responce.dart';
import 'package:fit_zone/domain/repo_contract/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepo loginRepo;
  LoginUseCase(this.loginRepo);

  Future<LoginResponse> call(
      {required String email, required String password}) {
    return loginRepo.login(email: email, password: password);
  }
}
