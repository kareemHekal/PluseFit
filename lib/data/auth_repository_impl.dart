import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/data/model/user_model.dart';
import 'package:fit_zone/domain/common/auth_repository.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiManager apiManager;
  AuthRepositoryImpl(this.apiManager);

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final apiResult = await executeApi(() async {
      final response = await apiManager.postRequest(
        endpoint: '/v1/auth/signin',
        body: {
          'email': email,
          'password': password,
        },
        headers: {'Content-Type': 'application/json'},
      );
      return response.data;
    });

    if (apiResult is SuccessApiResult) {
      return UserModel.fromJson(apiResult.data);
    } else if (apiResult is ErrorApiResult) {
      throw apiResult.exception;
    } else {
      throw Exception('Unknown error');
    }
  }
}
