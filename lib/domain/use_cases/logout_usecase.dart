import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/domain/repo_contract/logout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUsecase {
  LogoutRepo logoutRepoContract;
  @factoryMethod
  LogoutUsecase({required this.logoutRepoContract});

  Future<ApiResult<bool>> invoke() {
    return logoutRepoContract.logout();
  }
}
