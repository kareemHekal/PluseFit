import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/auth/register_datasource.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterDataSource)
class RegisterDatasourceImpl implements RegisterDataSource {
  final ApiManager _apiManager;

  RegisterDatasourceImpl(this._apiManager);

  @override
  Future<ApiResult<RegisterResponse>> register({
    required RegisterUserModel userModel,
  }) async {
    return executeApi(() async {
      final body = userModel.toJson();

      final apiResponse = await _apiManager.postRequest(
        endpoint: EndPoint.registerEndpoint,
        body: body,
      );

      final response = RegisterResponse.fromJson(apiResponse.data ?? {});
      return response;
    });
  }
}
