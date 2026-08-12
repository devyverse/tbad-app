import 'package:flutter/material.dart';

class TodayWidget extends StatelessWidget {
  final int minutes;
  final double intensity;

  const TodayWidget({
    super.key,
    required this.minutes,
    required this.intensity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text("Aujourd’hui", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text("$minutes min", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Text("Intensité ${(intensity * 100).round()}%"),
        ],
      ),
    );
  }
}
