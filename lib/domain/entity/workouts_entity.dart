class WorkoutEntity {
  final String? id;
  final String? name;
  final String? image;

  WorkoutEntity({this.id, this.name, this.image});
}

class MuscleGroupEntity {
  final String? id;
  final String name;

  MuscleGroupEntity({this.id, required this.name});
}
