// lib/domain/usecase/edit_profile_usecase.dart
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/edit_profile_model.dart';
import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:fit_zone/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUsecase {
  final EditProfileRepo repo;

  EditProfileUsecase(this.repo);

  Future<ApiResult<UserModel>> call({
    required EditProfileModel editProfileModel,
  }) async {
    return await repo.editProfile(editProfileModel: editProfileModel);
  }
}
