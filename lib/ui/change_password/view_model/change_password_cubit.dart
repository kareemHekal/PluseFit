import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_result.dart';
import '../../../domain/use_cases/change_password_usecase.dart';
import 'change_password_state.dart';
import 'change_password_intent.dart';
import 'dart:developer' as developer;

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUsecase changePasswordUsecase;

  ChangePasswordCubit(this.changePasswordUsecase)
      : super(ChangePasswordInitial());

  void onIntent(ChangePasswordIntent intent) async {
    if (intent is ChangePasswordRequestIntent) {
      await _handleChangePassword(intent);
    }
  }

  Future<void> _handleChangePassword(ChangePasswordRequestIntent intent) async {
    emit(ChangePasswordLoading());

    try {
      final result = await changePasswordUsecase.call(
        currentPassword: intent.currentPassword,
        newPassword: intent.newPassword,
      );

      developer.log('Change password result: $result');

      switch (result) {
        case SuccessApiResult():
          emit(ChangePasswordSuccess("Password changed successfully"));
        case ErrorApiResult(exception: final error):
          developer.log('Change password error: ${error.toString()}');
          emit(ChangePasswordFailure(error.toString()));
      }
    } catch (e) {
      developer.log('Unexpected error: $e');
      emit(ChangePasswordFailure(e.toString()));
    }
  }
}
