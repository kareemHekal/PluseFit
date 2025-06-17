import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';

abstract class RegisterDataSource {
  Future<ApiResult<RegisterResponse>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String gender,
    required int height,
    required double weight,
    required int age,
    required String activityLevel,
    required String goal,
  });
}
