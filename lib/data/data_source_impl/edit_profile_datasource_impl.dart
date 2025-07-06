// lib/data/datasource_impl/edit_profile_datasource_impl.dart
// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/core/cache/shared_pref.dart';
import 'package:fit_zone/core/constant.dart';
import 'package:fit_zone/data/data_source_contract/edit_profile_datasource.dart';
import 'package:fit_zone/data/model/edit_profile_model.dart';
import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileDatasource)
class EditProfileDatasourceImpl implements EditProfileDatasource {
  final ApiManager apiManager;

  EditProfileDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<UserModel>> editProfile({
    required EditProfileModel editProfileModel,
  }) async {
    final token = CacheHelper.getData<String>(Constant.tokenKey);

    return await executeApi<UserModel>(() async {
      final requestData = {
        if (editProfileModel.firstName != null)
          "firstName": editProfileModel.firstName,
        if (editProfileModel.lastName != null)
          "lastName": editProfileModel.lastName,
        if (editProfileModel.email != null) "email": editProfileModel.email,
        if (editProfileModel.weight != null) "weight": editProfileModel.weight,
        if (editProfileModel.activityLevel != null)
          "activityLevel": editProfileModel.activityLevel,
        if (editProfileModel.goal != null) "goal": editProfileModel.goal,
      };

      final headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

      final response = await apiManager.put(
        endpoint: EndPoint.editProfile,
        data: requestData,
        headers: headers,
      );

      return UserModel.fromJson(response.data);
    });
  }

  @override
  Future<ApiResult<bool>> uploadPhoto({required String photoPath}) async {
    final token = CacheHelper.getData<String>(Constant.tokenKey);

    return await executeApi<bool>(() async {
      final isPng = photoPath.toLowerCase().endsWith('.png');

      final file = await MultipartFile.fromFile(
        photoPath,
        filename: isPng ? 'photo.png' : 'photo.jpg',
        contentType: MediaType('image', isPng ? 'png' : 'jpeg'),
      );

      final formData = FormData();
      formData.files.add(MapEntry('photo', file));

      final response = await apiManager.putFormData(
        endpoint: EndPoint.uploadProfilePhoto,
        formData: formData,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.data is Map && response.data['message'] == 'success') {
        return true;
      } else {
        throw Exception("Failed to upload photo");
      }
    });
  }
}
