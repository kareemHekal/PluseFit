sealed class WorkoutsIntent {}

class WorkoutsGroupTabIntent extends WorkoutsIntent {
  final String id;
  final String name;

  WorkoutsGroupTabIntent({required this.id, required this.name});
}

class WorkoutsCardIntent extends WorkoutsIntent {
  final String cardId;

  WorkoutsCardIntent(this.cardId);
}
