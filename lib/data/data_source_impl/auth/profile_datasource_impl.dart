// ignore_for_file: unused_catch_stack

import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/core/cache/shared_pref.dart';
import 'package:fit_zone/core/constant.dart';
import 'package:fit_zone/data/data_source_contract/auth/profile_datasource.dart';
import 'package:fit_zone/data/model/profile/user_profile_model.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';

@Singleton(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource {
  final ApiManager apiManager;
  ProfileDataSourceImpl(this.apiManager);

  @override
  Future<UserProfileModel> getProfileData() async {
    try {
      final token = CacheHelper.getData<String>(Constant.tokenKey);
      final response = await apiManager.getRequest(
        endpoint: EndPoint.getUserData,
        headers: {'Authorization': 'Bearer $token'},
      );
      final data =
          response.data is String ? jsonDecode(response.data) : response.data;
      return UserProfileModel.fromJson(data['user']);
    } catch (e, stack) {
      rethrow;
    }
  }
}
