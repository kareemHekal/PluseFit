import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';

abstract interface class RegisterRepo {
  Future<ApiResult<RegisterResponse>> register({
    required RegisterUserModel userModel,
  });
}
