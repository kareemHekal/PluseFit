import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/auth/login_datasource.dart';
import 'package:fit_zone/data/model/login_responce.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {
  final ApiManager apiManager;
  LoginDataSourceImpl(this.apiManager);

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    final apiResult = await executeApi(() async {
      final response = await apiManager.postRequest(
        endpoint: EndPoint.loginEndpoint,
        body: {
          'email': email,
          'password': password,
        },
        headers: {'Content-Type': 'application/json'},
      );
      return response.data;
    });

    if (apiResult is SuccessApiResult) {
      return LoginResponse.fromJson(apiResult.data);
    } else if (apiResult is ErrorApiResult) {
      throw apiResult.exception;
    } else {
      throw Exception('Unknown error');
    }
  }
}
