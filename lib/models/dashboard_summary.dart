class DashboardSummary {
  final int sessionsThisWeek;
  final int totalMinutesThisWeek;
  final double avgIntensity;
  final String lastSessionType;
  final String recommendation;
  final String trend;

  DashboardSummary({
    required this.sessionsThisWeek,
    required this.totalMinutesThisWeek,
    required this.avgIntensity,
    required this.lastSessionType,
    required this.recommendation,
    required this.trend,
  });
}
