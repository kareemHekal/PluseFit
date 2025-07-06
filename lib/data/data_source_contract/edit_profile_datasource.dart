import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/edit_profile_model.dart';
import 'package:fit_zone/data/model/register_response/user_model.dart';

abstract class EditProfileDatasource {
  Future<ApiResult<UserModel>> editProfile({
    required EditProfileModel editProfileModel
  });

  Future<ApiResult<bool>> uploadPhoto({
    required String photoPath,
  });
}
