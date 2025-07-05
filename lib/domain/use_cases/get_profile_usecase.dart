import 'package:fit_zone/domain/entity/profile_entity.dart';
import 'package:fit_zone/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepo repo;
  GetProfileUseCase(this.repo);

  Future<ProfileEntity> execute() {
    print('GetProfileUseCase.execute called');
    return repo.getProfileData();
  }
}
