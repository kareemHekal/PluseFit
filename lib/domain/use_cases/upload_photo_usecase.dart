// lib/domain/usecase/upload_photo_usecase.dart
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUseCase {
  final EditProfileRepo repo;

  UploadPhotoUseCase(this.repo);

  Future<ApiResult<bool>> call({required String photoPath}) async {
    return await repo.uploadPhoto(photoPath: photoPath);
  }
}
