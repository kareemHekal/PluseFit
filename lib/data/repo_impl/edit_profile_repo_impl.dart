import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/edit_profile_datasource.dart';
import 'package:fit_zone/data/model/edit_profile_model.dart';
import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:fit_zone/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDatasource editProfileDatasource;

  EditProfileRepoImpl(this.editProfileDatasource);

  @override
  Future<ApiResult<UserModel>> editProfile({
    required EditProfileModel editProfileModel,
  }) async {
    return await editProfileDatasource.editProfile(
        editProfileModel: editProfileModel);
  }

  @override
  Future<ApiResult<bool>> uploadPhoto({required String photoPath}) async {
    return await editProfileDatasource.uploadPhoto(photoPath: photoPath);
  }
}
