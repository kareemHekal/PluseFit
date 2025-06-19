// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'auth_intent.dart';
import 'package:fit_zone/domain/usescases/login_usecase.dart';
import 'package:fit_zone/data/model/user_model.dart';
import 'package:fit_zone/core/di/di.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase = getIt<LoginUseCase>();
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void doIntent(AuthIntent authIntent) async {
    if (authIntent is LoginIntent) {
      emit(AuthLoading());
      try {
        final user = await loginUseCase(
            email: authIntent.email, password: authIntent.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    }
  }
}
