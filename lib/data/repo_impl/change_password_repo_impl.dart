import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../domain/repo_contract/change_password_repo.dart';
import '../data_source_contract/change_password_datasource.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordDatasource datasource;

  ChangePasswordRepoImpl(this.datasource);

  @override
  Future<ApiResult<bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await datasource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}