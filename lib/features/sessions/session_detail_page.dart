import 'package:flutter/material.dart';
import '../../models/session.dart';
import '../../services/session_service.dart';

class SessionDetailPage extends StatelessWidget {
  final Session session;

  const SessionDetailPage({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final service = SessionService.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détail séance"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await service.delete(session.id);
              if (context.mounted) Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InfoRow(
            label: "Type",
            value: session.type.name,
          ),
          _InfoRow(
            label: "Date",
            value:
                "${session.date.day}/${session.date.month}/${session.date.year}",
          ),
          _InfoRow(
            label: "Duration",
            value: "${session.durationMinutes} min",
          ),
          _InfoRow(
            label: "Intensity",
            value: "${(session.intensity * 100).round()}%",
          ),
          if (session.opponent != null) ...[
            const SizedBox(height: 12),
            _InfoRow(
              label: "Opponent",
              value: session.opponent!,
            ),
          ],
          if (session.scoreYou != null && session.scoreOpponent != null) ...[
            const SizedBox(height: 12),
            _InfoRow(
              label: "Score",S
              value: "${session.scoreYou} - ${session.scoreOpponent}",
            ),
          ],
          const SizedBox(height: 16),
          const Text(
            "Notes",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            session.notes.isEmpty ? "Aucune note" : session.notes,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label : ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
