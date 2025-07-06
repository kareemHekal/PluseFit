import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/auth/logout_datasource.dart';
import 'package:fit_zone/domain/repo_contract/logout_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRepo)
class LogoutRepoImpl implements LogoutRepo{
  LogoutDatasource logoutDatasource;

  LogoutRepoImpl({required this.logoutDatasource});

  @override
  Future<ApiResult<bool>> logout() {
    return logoutDatasource.logout();
  }
}