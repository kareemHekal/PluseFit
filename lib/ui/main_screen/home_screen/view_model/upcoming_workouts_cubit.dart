import 'package:fit_zone/domain/use_cases/get_muscles_groups_usecase.dart';
import 'package:fit_zone/domain/use_cases/get_workouts_by_muscle_group_id_usecase.dart';
import 'package:fit_zone/ui/main_screen/home_screen/view_model/upcoming_workouts_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:math';

@injectable
class UpcomingWorkoutsCubit extends Cubit<UpcomingWorkoutsStates> {
  final GetMusclesGroupsUseCase getMusclesGroupsUseCase;
  final GetWorkoutsByMuscleGroupIdUseCase getWorkoutsByMuscleGroupIdUseCase;

  UpcomingWorkoutsCubit(
      this.getMusclesGroupsUseCase, this.getWorkoutsByMuscleGroupIdUseCase)
      : super(UpcomingWorkoutsInitial());

  void getWorkouts() async {
    emit(UpcomingWorkoutsLoading());
    var result = await getMusclesGroupsUseCase.execute();
    result.fold(
      (error) => emit(UpcomingWorkoutsError(error.errorModel?.message ?? "")),
      (muscleGroups) {
        // Filter allowed muscle groups
        final allowedNames = [
          "Full Body",
          "Chest",
          "Back",
          "Shoulder",
          "Arm",
          "Legs",
          "Stomach"
        ];
        final allowedGroups = muscleGroups
            .where((group) => allowedNames.contains(group.name))
            .toList();
        if (allowedGroups.isEmpty) {
          emit(UpcomingWorkoutsError("No muscle groups available"));
          return;
        }
        // Pick a random muscle group
        final random = Random();
        final randomIndex = random.nextInt(allowedGroups.length);
        final randomGroup = allowedGroups[randomIndex];
        getWorkoutsByMuscleGroupId(randomGroup.id ?? "", randomIndex);
      },
    );
  }

  void getWorkoutsByMuscleGroupId(String muscleGroupId, int index) async {
    final currentState = state;
    if (currentState is UpcomingWorkoutsSuccess) {
      emit(currentState.copyWith(selectedIndex: index));
    }

    var result = await getWorkoutsByMuscleGroupIdUseCase.execute(muscleGroupId);
    result.fold(
      (error) => emit(UpcomingWorkoutsError(error.errorModel?.message ?? "")),
      (workouts) {
        workouts.shuffle();
        final randomWorkouts = workouts.take(4).toList();
        if (currentState is UpcomingWorkoutsSuccess) {
          emit(currentState.copyWith(
              workouts: randomWorkouts, selectedIndex: index));
        } else {
          emit(UpcomingWorkoutsSuccess(
              muscleGroups: const [],
              workouts: randomWorkouts,
              selectedIndex: index));
        }
      },
    );
  }

  void selectTab(int index) {
    final currentState = state;
    if (currentState is UpcomingWorkoutsSuccess) {
      emit(currentState.copyWith(selectedIndex: index));
    }
  }
}
