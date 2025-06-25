import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:fit_zone/domain/repo_contract/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepo loginRepo;
  LoginUseCase(this.loginRepo);

  Future<UserModel> call({required String email, required String password}) {
    return loginRepo.login(email: email, password: password);
  }
}
