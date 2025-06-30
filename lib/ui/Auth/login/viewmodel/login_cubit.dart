// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:fit_zone/core/cache/shared_pref.dart';
import 'package:fit_zone/core/constant.dart';
import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:fit_zone/domain/use_cases/login_usecase.dart';
import 'package:fit_zone/ui/auth/login/viewmodel/login_intent.dart';
import 'package:fit_zone/ui/auth/login/viewmodel/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase = getIt<LoginUseCase>();
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void doIntent(LoginIntent loginIntent) async {
    emit(LoginLoading());
    try {
      final user = await loginUseCase(
          email: loginIntent.email, password: loginIntent.password);
      await CacheHelper.setData(Constant.tokenKey, user.token);
      await CacheHelper.setData(Constant.userName, user.user?.firstName);
      emit(LoginSuccess(user.user ?? UserModel()));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
