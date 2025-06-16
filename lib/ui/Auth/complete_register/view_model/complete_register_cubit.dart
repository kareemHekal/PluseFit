// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:fit_zone/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'complete_register_intent.dart';

part 'complete_register_state.dart';

@injectable
class CompleteRegisterCubit extends Cubit<CompleteRegisterState> {
  CompleteRegisterCubit() : super(CompleteRegisterInitial());

  static CompleteRegisterCubit get(context) => BlocProvider.of(context);

  UserModel user = UserModel();

  int currentIndex = 1;

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

  void _updateIndex(bool isBackButton) {
    if (isBackButton) {
      currentIndex == 1 ? emit(ExitScreen()) : currentIndex--;
      emit(IndexUpdated());
    } else {
      currentIndex == 6 ? _registerUser : currentIndex++;
      emit(IndexUpdated());
    }
  }

  void _updateUser(UpdateUserIntent? intent) {
    if (intent == null) return;
    user
      ..firstName = intent.firstName ?? user.firstName
      ..lastName = intent.lastName ?? user.lastName
      ..email = intent.email ?? user.email
      ..gender = intent.gender ?? user.gender
      ..age = intent.age ?? user.age
      ..weight = intent.weight ?? user.weight
      ..height = intent.height ?? user.height
      ..activityLevel = intent.activityLevel ?? user.activityLevel
      ..goal = intent.goal ?? user.goal;
    emit(UserUpdated());
  }

  void _registerUser() {
    //  👇 delete this it just for test
    currentIndex = 1;
    // add here your function or delete it and add your own
  }
}
