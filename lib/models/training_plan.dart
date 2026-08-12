enum TrainingFocus {
  movement,
  power,
  endurance,
  precision,
  matchPlay,
}

class TrainingPlan {
  final String id;
  final String title;
  final TrainingFocus focus;
  final int durationMinutes;
  final String description;

  TrainingPlan({
    required this.id,
    required this.title,
    required this.focus,
    required this.durationMinutes,
    required this.description,
  });
}
