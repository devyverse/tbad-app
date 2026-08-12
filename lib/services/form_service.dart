import 'session_service.dart';

class FormService {
  double computeFormScore() {
    final sessions = SessionService.instance.all;

    if (sessions.isEmpty) return 0.5;

    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));

    final weekSessions = sessions.where((s) => s.date.isAfter(weekStart)).toList();

    final volume = weekSessions.fold(0, (sum, s) => sum + s.durationMinutes);
    final intensity = weekSessions.isEmpty
        ? 0.5
        : weekSessions.fold(0.0, (sum, s) => sum + s.intensity) / weekSessions.length;

    // Score simple : 50% intensité + 50% volume normalisé
    final volumeScore = (volume / 300).clamp(0.0, 1.0);

    return (intensity * 0.5 + volumeScore * 0.5).clamp(0.0, 1.0);
  }
}
