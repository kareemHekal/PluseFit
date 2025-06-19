// ignore_for_file: file_names

import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:fit_zone/domain/repo_contract/register_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final RegisterRepo registerContract;

  @factoryMethod
  RegisterUseCase({
    required this.registerContract,
  });

  Future<ApiResult<RegisterResponse>> invoke(
      {required RegisterUserModel userModel}) async {
    final result = await registerContract.register(userModel: userModel);
    return result;
  }
}
