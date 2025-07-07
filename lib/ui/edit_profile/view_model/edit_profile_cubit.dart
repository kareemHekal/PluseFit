// lib/presentation/tabs/profile_tab/edit_profile/view_model/edit_profile_cubit.dart
// ignore_for_file: unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/edit_profile_model.dart';
import 'package:fit_zone/domain/entity/profile_entity.dart';
import 'package:fit_zone/domain/use_cases/edit_profile_usecase.dart';
import 'package:fit_zone/domain/use_cases/get_profile_usecase.dart';
import 'package:fit_zone/domain/use_cases/upload_photo_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'edit_profile_intent.dart';
import 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUsecase editProfileUseCase;
  final UploadPhotoUseCase uploadPhotoUseCase;
  final GetProfileUseCase getProfileUseCase;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  ProfileEntity? editProfileModel;

  EditProfileCubit(
      this.editProfileUseCase, this.uploadPhotoUseCase, this.getProfileUseCase)
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

    final result = await editProfileUseCase.call(
      editProfileModel: EditProfileModel(
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        weight: editProfileModel?.weight?.toDouble(),
        goal: editProfileModel?.goal,
        activityLevel: editProfileModel?.activityLevel,
      ),
    );

    switch (result) {
      case SuccessApiResult():
        emit(EditProfileSuccess());
        break;
      case ErrorApiResult(exception: final error):
        emit(EditProfileFailure(error.toString()));
        break;
    }
  }

  Future<void> _handleUploadPhoto(UploadPhotoIntent intent) async {
    emit(EditProfileLoading());

    final result = await uploadPhotoUseCase.call(photoPath: intent.photoPath);

    switch (result) {
      case SuccessApiResult():
        emit(PhotoUploadSuccess());
      case ErrorApiResult(exception: final error):
        emit(PhotoUploadFailure(error.toString()));
    }
  }

  Future<void> _getLoggedUserData() async {
    emit(EditProfileLoading());

    try {
      final result = await getProfileUseCase.execute();
      editProfileModel = result;
      firstNameController.text = result.firstName ?? '';
      lastNameController.text = result.lastName ?? '';
      emailController.text = result.email ?? '';
      emit(GetUserDataSuccess(result));
    } catch (e) {
      emit(GetUserDataFailure(e.toString()));
    }
  }
}
