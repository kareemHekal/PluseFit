import 'package:fit_zone/domain/use_cases/get_profile_usecase.dart';
import 'package:fit_zone/ui/main_screen/profile_screen/profile_intent.dart';
import 'package:fit_zone/ui/main_screen/profile_screen/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit(this.getProfileUseCase) : super(ProfileInitial());

  void doIntent(ProfileIntent intent) async {
    if (intent is LoadProfileIntent) {
      emit(ProfileLoading());
      try {
        final profile = await getProfileUseCase.execute();
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    }
  }
}
