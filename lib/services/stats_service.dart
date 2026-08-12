import '../models/session.dart';
import '../models/stat_summary.dart';

class StatsService {
  StatSummary compute(List<Session> sessions) {
    if (sessions.isEmpty) {
      return StatSummary(
        totalSessions: 0,
        totalMatches: 0,
        totalMinutes: 0,
        avgIntensity: 0,
        avgRallyLength: 0,
      );
    }

    final totalSessions = sessions.length;
    final totalMatches =
        sessions.where((s) => s.type == SessionType.match).length;
    final totalMinutes =
        sessions.fold<int>(0, (sum, s) => sum + s.durationMinutes);
    final avgIntensity =
        sessions.fold<double>(0, (sum, s) => sum + s.intensity) /
            sessions.length;

    // Pour l’instant, valeur fixe ou à calculer plus tard
    const avgRallyLength = 0.0;

    return StatSummary(
      totalSessions: totalSessions,
      totalMatches: totalMatches,
      totalMinutes: totalMinutes,
      avgIntensity: avgIntensity,
      avgRallyLength: avgRallyLength,
    );
  }
}
