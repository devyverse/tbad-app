import 'package:flutter/material.dart';
import '../../services/session_service.dart';
import '../../services/stats_service.dart';
import '../../widgets/stat_card.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sessions = SessionService.instance.all;
    final stats = StatsService().compute(sessions);

    return Scaffold(
      appBar: AppBar(title: const Text("Statistiques")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            StatCard(
              title: "Séances",
              value: stats.totalSessions.toString(),
              subtitle: "Total",
              icon: Icons.fitness_center,
            ),
            const SizedBox(height: 12),
            StatCard(
              title: "Matchs",
              value: stats.totalMatches.toString(),
              subtitle: "Compétition + entraînement",
              icon: Icons.sports_tennis,
            ),
            const SizedBox(height: 12),
            StatCard(
              title: "Durée totale",
              value: "${stats.totalMinutes} min",
              subtitle: "Volume global",
              icon: Icons.timer,
            ),
            const SizedBox(height: 12),
            StatCard(
              title: "Intensité moyenne",
              value: "${(stats.avgIntensity * 100).round()}%",
              subtitle: "Charge globale",
              icon: Icons.local_fire_department,
            ),
          ],
        ),
      ),
    );
  }
}
