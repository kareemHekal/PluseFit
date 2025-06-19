// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:fit_zone/domain/use_cases/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'complete_register_intent.dart';

part 'complete_register_state.dart';

@injectable
class CompleteRegisterCubit extends Cubit<RegisterStates> {
  CompleteRegisterCubit(this.registerUseCase)
      : super(CompleteRegisterInitial());

  static CompleteRegisterCubit get(context) => BlocProvider.of(context);
  final RegisterUseCase registerUseCase;
  RegisterUserModel user = RegisterUserModel();

  void doIntent(CompleteRegisterIntent Intent) {
    switch (Intent) {
      case UpdateIndex():
        _updateIndex(Intent.isBackButton);
        break;
      case UpdateUserIntent():
        _updateUser(Intent);
        break;
    }
  }

  int currentIndex = 1;

  void _updateIndex(bool isBackButton) {
    if (isBackButton) {
      if (currentIndex == 1) {
        emit(ExitScreen());
      } else {
        currentIndex--;
        emit(IndexUpdated());
      }
    } else {
      if (currentIndex < 6) {
        currentIndex++;
        emit(IndexUpdated());
      } else {
        _register();
        print(user);
      }
    }
  }

  void _updateUser(UpdateUserIntent? intent) {
    if (intent == null) return;
    user
      ..firstName = intent.firstName ?? user.firstName
      ..lastName = intent.lastName ?? user.lastName
      ..email = intent.email ?? user.email
      ..password = intent.password ?? user.password
      ..gender = intent.gender ?? user.gender
      ..age = intent.age ?? user.age
      ..weight = intent.weight ?? user.weight
      ..height = intent.height ?? user.height
      ..activityLevel = intent.activityLevel ?? user.activityLevel
      ..goal = intent.goal ?? user.goal;
    emit(UserUpdated());
  }

  _register() async {
    emit(RegisterLoadingState());
    final result = await registerUseCase.invoke(userModel: user);
    switch (result) {
      case SuccessApiResult():
        emit(RegisterSuccessState(response: result.data));
        break;
      case ErrorApiResult():
        print("${result.exception.toString()} Error ⛔⛔");
        emit(RegisterErrorState(message: result.exception.toString()));
        break;
    }
  }
}
