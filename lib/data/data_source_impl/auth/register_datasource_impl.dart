import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/auth/register_datasource.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterDataSource)
class RegisterDatasourceImpl implements RegisterDataSource {
  final ApiManager apiManager;
  RegisterDatasourceImpl({required this.apiManager});
  @override
  Future<ApiResult<RegisterResponse>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String gender,
      required int height,
      required double weight,
      required int age,
      required String activityLevel,
      required String goal}) async {
    return executeApi(
      () async {
        var apiResponse = await apiManager.postRequest(
          endpoint: EndPoint.registerEndpoint,
          body: {
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password,
            "rePassword": password,
            "gender": gender,
            "height": height,
            "weight": weight,
            "age": age,
            "goal": goal,
            "activityLevel": activityLevel
          },
        );
        var response = RegisterResponse.fromJson(apiResponse.data ?? []);
        return response;
      },
    );
  }
}
