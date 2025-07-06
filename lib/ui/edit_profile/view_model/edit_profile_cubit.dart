// lib/presentation/tabs/profile_tab/edit_profile/view_model/edit_profile_cubit.dart
// ignore_for_file: unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/edit_profile_model.dart';
import 'package:fit_zone/domain/use_cases/edit_profile_usecase.dart';
import 'package:fit_zone/domain/use_cases/upload_photo_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'edit_profile_intent.dart';
import 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUsecase editProfileUsecase;
  final UploadPhotoUseCase uploadPhotoUsecase;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  EditProfileModel editProfileModel = EditProfileModel();
  EditProfileCubit(this.editProfileUsecase, this.uploadPhotoUsecase)
      : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  void doIntent(EditProfileIntent intent) {
    switch (intent) {
      case UpdateProfileIntent():
        _handleUpdateProfile(intent);
        break;
      case UploadPhotoIntent():
        _handleUploadPhoto(intent);
        break;
      case GetLoggedUserData():
        _getLoggedUserData();
        break;
    }
  }

  Future<void> _handleUpdateProfile(UpdateProfileIntent intent) async {
    emit(EditProfileLoading());

    final result = await editProfileUsecase.call(
      editProfileModel: intent.editProfileModel,
    );

    switch (result) {
      case SuccessApiResult():
        emit(EditProfileSuccess());
      case ErrorApiResult(exception: final error):
        emit(EditProfileFailure(error.toString()));
        break;
    }
  }

  Future<void> _handleUploadPhoto(UploadPhotoIntent intent) async {
    emit(EditProfileLoading());

    final result = await uploadPhotoUsecase.call(photoPath: intent.photoPath);

    switch (result) {
      case SuccessApiResult():
        emit(PhotoUploadSuccess());
      case ErrorApiResult(exception: final error):
        emit(PhotoUploadFailure(error.toString()));
    }
  }

  _getLoggedUserData() async {
    // emit(EditProfileLoading());
    // final result = await getLoggedUserDataUsecase.call();
    //
    // switch (result) {
    //   case SuccessApiResult():
    //     emit(GetUserDataSuccess());
    //   case ErrorApiResult(exception: final error):
    //     emit(GetUserDataFailure(error.toString()));
    // }
  }
}
