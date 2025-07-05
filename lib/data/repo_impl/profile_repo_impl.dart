import 'package:fit_zone/data/data_source_contract/auth/profile_datasource.dart';
import 'package:fit_zone/domain/entity/profile_entity.dart';
import 'package:fit_zone/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource dataSource;
  ProfileRepoImpl(this.dataSource);

  @override
  Future<ProfileEntity> getProfileData() async {
    print('ProfileRepoImpl.getProfileData called');
    final model = await dataSource.getProfileData();
    return ProfileEntity.fromModel(model);
  }
}
