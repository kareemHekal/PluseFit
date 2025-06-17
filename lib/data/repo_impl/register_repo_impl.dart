import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/auth/register_datasource.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:fit_zone/domain/repo_contract/register_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterContract)
class RegisterRepoImpl implements RegisterContract {
  RegisterDataSource registerDataSourse;

  @factoryMethod
  RegisterRepoImpl(this.registerDataSourse);

  @override
  Future<ApiResult<RegisterResponse>> register(
      {required RegisterUserModel userModel}) {
    return registerDataSourse.register(userModel: userModel);
  }
}
