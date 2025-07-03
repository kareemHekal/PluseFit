import 'package:fit_zone/data/model/get_all_level_response.dart';
import 'package:fit_zone/domain/use_cases/exercise_by_muscle_usecase.dart';
import 'package:fit_zone/domain/use_cases/level_usecase.dart';
import 'package:fit_zone/ui/exercise/view_model/cubit/level_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_result.dart';
import '../../../../data/model/exercise_by_muscle/exercise_by_muscle_response.dart';

part 'level_state.dart';
@injectable
class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseByMuscleUsecase exerciseByMuscleUsecase;
  LevelUsecase levelUsecase;
  ExerciseCubit(this.levelUsecase,this.exerciseByMuscleUsecase) : super(LevelInitial());

  static ExerciseCubit get(BuildContext context) => BlocProvider.of(context);
  void doIntent(ExerciseIntent intent) {
    if (intent is Level) {
      _getLevel(intent: intent);
    }else if(intent is Exercise){
      _getExercise(intent: intent);
    }

  }

  Future<void> _getLevel({required Level intent}) async {
    emit(LevelLoadingState());

    final result = await levelUsecase.call();

    if (result is SuccessApiResult<GetAllLevelResponse>) {
      emit(LevelSuccessState(result.data));
    } else if (result is ErrorApiResult<GetAllLevelResponse>) {
      emit(LevelErrorState(result.exception.toString()));
    }
  }


  Future<void> _getExercise({required Exercise intent}) async{
    emit(ExerciseLoadingState());
    final result=await exerciseByMuscleUsecase.call(primeMoverMuscleId: intent.primeMoverMuscleId, difficultyLevelId: intent.difficultyLevelId);
    if (result is SuccessApiResult<ExerciseByMuscleResponse>) {
      emit(ExerciseSuccessState(result.data));
    } else if (result is ErrorApiResult<ExerciseByMuscleResponse>) {
      emit(ExerciseErrorState(result.exception.toString()));
    }



  }

  Future<void> loadLevelsAndExercises(String muscleId) async {
    emit(LevelLoadingState());

    final levelsResult = await levelUsecase.call();

    if (levelsResult is SuccessApiResult<GetAllLevelResponse>) {
      final levels = levelsResult.data!.levels ?? [];
      emit(LevelSuccessState(levelsResult.data));

      // ✅ لو فيه ليفلز نبدأ نجيب أول مجموعة تمارين تلقائيًا
      if (levels.isNotEmpty) {
        final firstLevelId = levels.first.id ?? "";

        emit(ExerciseLoadingState()); // نعرض لودينج مؤقت للتمارين

        final exercisesResult = await exerciseByMuscleUsecase.call(
          primeMoverMuscleId: muscleId,
          difficultyLevelId: firstLevelId,
        );

        if (exercisesResult is SuccessApiResult<ExerciseByMuscleResponse>) {
          emit(ExerciseSuccessState(exercisesResult.data));
        } else if (exercisesResult is ErrorApiResult<ExerciseByMuscleResponse>) {
          emit(ExerciseErrorState(exercisesResult.exception.toString()));
        }
      }
    } else if (levelsResult is ErrorApiResult<GetAllLevelResponse>) {
      emit(LevelErrorState(levelsResult.exception.toString()));
    }
  }


}
