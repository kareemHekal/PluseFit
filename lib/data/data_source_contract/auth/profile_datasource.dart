import 'package:fit_zone/data/model/profile/user_profile_model.dart';

abstract class ProfileDataSource {
  Future<UserProfileModel> getProfileData();
}
