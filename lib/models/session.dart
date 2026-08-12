enum SessionType {
  training,
  match,
  physical,
  technique,
}

class Session {
  final String id;
  final DateTime date;
  final SessionType type;
  final int durationMinutes;
  final double intensity; // 0.0 → 1.0
  final String notes;

  final String? opponent;
  final int? scoreYou;
  final int? scoreOpponent;

  Session({
    required this.id,
    required this.date,
    required this.type,
    required this.durationMinutes,
    required this.intensity,
    required this.notes,
    this.opponent,
    this.scoreYou,
    this.scoreOpponent,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'type': type.index,
        'durationMinutes': durationMinutes,
        'intensity': intensity,
        'notes': notes,
        'opponent': opponent,
        'scoreYou': scoreYou,
        'scoreOpponent': scoreOpponent,
      };

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json['id'],
        date: DateTime.parse(json['date']),
        type: SessionType.values[json['type']],
        durationMinutes: json['durationMinutes'],
        intensity: (json['intensity'] as num).toDouble(),
        notes: json['notes'],
        opponent: json['opponent'],
        scoreYou: json['scoreYou'],
        scoreOpponent: json['scoreOpponent'],
      );
}
