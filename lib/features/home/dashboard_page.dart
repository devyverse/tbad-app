import 'package:flutter/material.dart';
import '../../services/dashboard_service.dart';
import '../../models/dashboard_summary.dart';

// Import des widgets graphiques
import '../../widgets/today_widget.dart';
import '../../widgets/charts/intensity_line_chart.dart';
import '../../widgets/charts/volume_bar_chart.dart';
import '../../widgets/ring_progress.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = DashboardService().compute();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---------------------------
          // SECTION : TODAY
          // ---------------------------
          TodayWidget(
            minutes: summary.totalMinutesThisWeek,
            intensity: summary.avgIntensity,
          ),
          const SizedBox(height: 24),

          // ---------------------------
          // SECTION : INTENSITY GRAPHIC
          // ---------------------------
          Text(
            "Intensity (7 days)",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: IntensityLineChart(
              values: [0.3, 0.5, 0.7, 0.6, 0.8], // TODO: vraies données
            ),
          ),
          const SizedBox(height: 24),

          // ---------------------------
          // SECTION :  HEBDO VOLUME
          // ---------------------------
          Text(
            "Volume (minutes / jour)",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: VolumeBarChart(
              minutes: [30, 45, 60, 20, 0, 90, 50], // TODO: vraies données
            ),
          ),
          const SizedBox(height: 24),

          // ---------------------------
          // SECTION : HEBDO GOAL
          // ---------------------------
          Text(
            "Objectif hebdomadaire",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Center(
            child: RingProgress(
              progress: (summary.totalMinutesThisWeek / 300).clamp(0.0, 1.0),
              label: "Objectif",
            ),
          ),
          const SizedBox(height: 24),

          // ---------------------------
          // SECTION : RÉSUMÉ
          // ---------------------------
          Text(
            "Resume the Week",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          _Card(
            title: "Seance your week",
            value: summary.sessionsThisWeek.toString(),
            icon: Icons.calendar_today,
          ),
          const SizedBox(height: 12),

          _Card(
            title: "Total Volume",
            value: "${summary.totalMinutesThisWeek} min",
            icon: Icons.timer,
          ),
          const SizedBox(height: 12),

          _Card(
            title: "Intensity Moyenne",
            value: "${(summary.avgIntensity * 100).round()}%",
            icon: Icons.local_fire_department,
          ),
          const SizedBox(height: 12),

          _Card(
            title: "Last Session",
            value: summary.lastSessionType,
            icon: Icons.sports_tennis,
          ),
          const SizedBox(height: 24),

          Text(
            "Tendance",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          _Card(
            title: "Tendance générale",
            value: summary.trend,
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 24),

          Text(
            "Recommandation",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              summary.recommendation,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _Card({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
