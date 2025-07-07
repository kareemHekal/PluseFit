
sealed class EditProfileIntent {}

class UpdateProfileIntent extends EditProfileIntent {}

class UploadPhotoIntent extends EditProfileIntent {
  final String photoPath;

  UploadPhotoIntent({required this.photoPath});
}

class GetLoggedUserData extends EditProfileIntent {}
