// lib/presentation/tabs/profile_tab/edit_profile/view_model/edit_profile_state.dart

sealed class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  final String message;

  EditProfileFailure(this.message);
}

class GetUserDataSuccess extends EditProfileState {}

class GetUserDataFailure extends EditProfileState {
  final String message;

  GetUserDataFailure(this.message);
}

class PhotoUploadSuccess extends EditProfileState {}

class PhotoUploadFailure extends EditProfileState {
  final String message;

  PhotoUploadFailure(this.message);
}
