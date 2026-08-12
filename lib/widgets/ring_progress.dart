import 'package:flutter/material.dart';

class RingProgress extends StatelessWidget {
  final double progress;
  final String label;

  const RingProgress({
    super.key,
    required this.progress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 12,
            backgroundColor: Colors.grey.withOpacity(0.2),
            color: Theme.of(context).colorScheme.primary,
          ),
          Text("${(progress * 100).round()}%"),
        ],
      ),
    );
  }
}
