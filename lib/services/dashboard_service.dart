import '../models/dashboard_summary.dart';
import '../models/session.dart';
import 'session_service.dart';
import 'stats_service.dart';
import 'profile_service.dart';
import '../models/user_profile.dart'; // <-- IMPORTANT

class DashboardService {
  DashboardSummary compute() {
    final sessions = SessionService.instance.all;
    final stats = StatsService().compute(sessions);
    final profile = ProfileService.instance.profile;

    if (sessions.isEmpty) {
      return DashboardSummary(
        sessionsThisWeek: 0,
        totalMinutesThisWeek: 0,
        avgIntensity: 0.0,
        lastSessionType: "Aucune séance",
        recommendation: "Commence par une séance légère pour te remettre en route.",
        trend: "Stable",
      );
    }

    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));

    final weekSessions = sessions.where((s) => s.date.isAfter(weekStart)).toList();

    final sessionsThisWeek = weekSessions.length;
    final totalMinutesThisWeek =
        weekSessions.fold(0, (sum, s) => sum + s.durationMinutes);

    final avgIntensity = weekSessions.isEmpty
        ? 0.0
        : weekSessions.fold(0.0, (sum, s) => sum + s.intensity) /
            weekSessions.length;

    final last = sessions.first;

    // --- Analyse intelligente --- //
    String recommendation = "";

    switch (profile.style) {
      case PlayerStyle.offensive:
        recommendation = avgIntensity < 0.6
            ? "Ton style est offensif. Ajoute une séance puissance/smash cette semaine."
            : "Bonne intensité ! Continue le travail explosif.";
        break;

      case PlayerStyle.defensive:
        recommendation = totalMinutesThisWeek < 120
            ? "Ton style défensif demande de l’endurance. Ajoute une séance longue."
            : "Tu construis une bonne base d’endurance.";
        break;

      case PlayerStyle.allRound:
        recommendation = "Style polyvalent : équilibre entre technique, match et déplacement.";
        break;

      default: // <-- OBLIGATOIRE POUR FLUTTER WEB
        recommendation = "Analyse indisponible.";
        break;
    }

    final trend = avgIntensity > 0.6 ? "En hausse" : "Stable";

    return DashboardSummary(
      sessionsThisWeek: sessionsThisWeek,
      totalMinutesThisWeek: totalMinutesThisWeek,
      avgIntensity: avgIntensity.toDouble(),
      lastSessionType: last.type.name,
      recommendation: recommendation,
      trend: trend,
    );
  }
}
