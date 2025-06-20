part of 'complete_register_cubit.dart';

@immutable
sealed class RegisterStates {}

final class CompleteRegisterInitial extends RegisterStates {}

final class IndexUpdated extends RegisterStates {}

final class UserUpdated extends RegisterStates {}

final class ExitScreen extends RegisterStates {}

final class RegisterSuccessState extends RegisterStates {
  final RegisterResponse? response;

  RegisterSuccessState({required this.response});
}

final class RegisterLoadingState extends RegisterStates {}

final class RegisterErrorState extends RegisterStates {
  final String? message;

  RegisterErrorState({required this.message});
}
