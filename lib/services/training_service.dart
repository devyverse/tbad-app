import '../models/training_plan.dart';
import '../models/session.dart';

class TrainingService {
  List<TrainingPlan> suggest(List<Session> sessions) {
    // Logique simple pour l’instant : suggestions génériques
    return [
      TrainingPlan(
        id: "1",
        title: "Déplacement + régularité",
        focus: TrainingFocus.movement,
        durationMinutes: 45,
        description: "Travail de déplacement en fond de court + régularité.",
      ),
      TrainingPlan(
        id: "2",
        title: "Smash & puissance",
        focus: TrainingFocus.power,
        durationMinutes: 30,
        description: "Séries de smashs, travail explosif.",
      ),
      TrainingPlan(
        id: "3",
        title: "Endurance sur demi-terrain",
        focus: TrainingFocus.endurance,
        durationMinutes: 40,
        description: "Rallyes longs, travail de tenue de l’échange.",
      ),
    ];
  }
}
