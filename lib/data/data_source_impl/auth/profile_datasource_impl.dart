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
    print('getProfileData CALLED - VERY TOP');
    try {
      print('getProfileData CALLED');
      final token = CacheHelper.getData<String>(Constant.tokenKey);
      print('TOKEN: $token');
      final response = await apiManager.getRequest(
        endpoint: EndPoint.getUserData,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('PROFILE RESPONSE TYPE: ${response.data.runtimeType}');
      print('PROFILE RESPONSE: ${response.data}');
      final data =
          response.data is String ? jsonDecode(response.data) : response.data;
      print('PROFILE DATA (decoded if needed): $data');
      print('PROFILE USER: ${data['user']}');
      print('PROFILE USER TYPE: ${data['user'].runtimeType}');
      return UserProfileModel.fromJson(data['user']);
    } catch (e, stack) {
      print('ERROR in getProfileData: $e');
      print(stack);
      rethrow;
    }
  }
}
