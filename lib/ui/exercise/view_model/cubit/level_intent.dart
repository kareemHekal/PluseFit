sealed class ExerciseIntent {}


/// Exercise INTENT ///
class Exercise extends ExerciseIntent {
  String primeMoverMuscleId;
  String difficultyLevelId;
  Exercise({required this.difficultyLevelId,required this.primeMoverMuscleId });
}


/// Level INTENT ///
class Level extends ExerciseIntent {
  Level();
}

