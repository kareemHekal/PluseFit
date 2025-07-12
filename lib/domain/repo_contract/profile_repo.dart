import 'package:fit_zone/domain/entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<ProfileEntity> getProfileData();
}
