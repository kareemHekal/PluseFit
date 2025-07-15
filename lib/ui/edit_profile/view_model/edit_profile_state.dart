// lib/presentation/tabs/profile_tab/edit_profile/view_model/edit_profile_state.dart

import 'package:fit_zone/domain/entity/profile_entity.dart';

sealed class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  final String message;

  EditProfileFailure(this.message);
}

class GetUserDataSuccess extends EditProfileState {
  final ProfileEntity editProfileModel;

  GetUserDataSuccess(this.editProfileModel);
}

class GetUserDataFailure extends EditProfileState {
  final String message;

  GetUserDataFailure(this.message);
}

class PhotoUploadSuccess extends EditProfileState {}

class PhotoUploadFailure extends EditProfileState {
  final String message;

  PhotoUploadFailure(this.message);
}
