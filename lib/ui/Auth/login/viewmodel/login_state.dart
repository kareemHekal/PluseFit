import 'package:fit_zone/data/model/register_response/user_model.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserModel user;
  LoginSuccess(this.user);
}

final class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
