import 'package:fit_zone/data/model/edit_profile_model.dart';

sealed class EditProfileIntent {}

class UpdateProfileIntent extends EditProfileIntent {
  final EditProfileModel editProfileModel;

  UpdateProfileIntent({required this.editProfileModel});
}

class UploadPhotoIntent extends EditProfileIntent {
  final String photoPath;

  UploadPhotoIntent({required this.photoPath});
}

class GetLoggedUserData extends EditProfileIntent {}
