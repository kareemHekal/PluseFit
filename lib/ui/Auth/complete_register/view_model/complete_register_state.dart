part of 'complete_register_cubit.dart';

@immutable
sealed class CompleteRegisterState {}

final class CompleteRegisterInitial extends CompleteRegisterState {}

final class IndexUpdated extends CompleteRegisterState {}

final class UserUpdated extends CompleteRegisterState {}

final class ExitScreen extends CompleteRegisterState {}
