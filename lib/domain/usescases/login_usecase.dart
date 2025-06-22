import 'package:injectable/injectable.dart';
import '../common/login_repo.dart';
import '../../data/model/user_model.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<UserModel> call({required String email, required String password}) {
    return repository.login(email: email, password: password);
  }
}
