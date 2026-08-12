import 'package:uuid/uuid.dart';
import '../models/session.dart';
import 'storage_service.dart';

class SessionService {
  static final SessionService instance = SessionService._internal();
  SessionService._internal();

  final _storage = StorageService("sessions.json");
  final _uuid = const Uuid();

  List<Session> _sessions = [];

  Future<void> load() async {
    final raw = await _storage.readList();
    _sessions = raw.map((e) => Session.fromJson(e)).toList();
    _sessions.sort((a, b) => b.date.compareTo(a.date));
  }

  List<Session> get all => List.unmodifiable(_sessions);

  Future<void> add(Session session) async {
    _sessions.add(session);
    await _save();
  }

  Future<void> update(Session session) async {
    final index = _sessions.indexWhere((s) => s.id == session.id);
    if (index != -1) {
      _sessions[index] = session;
      await _save();
    }
  }

  Future<void> delete(String id) async {
    _sessions.removeWhere((s) => s.id == id);
    await _save();
  }

  Future<void> _save() async {
    await _storage.writeList(_sessions.map((e) => e.toJson()).toList());
  }

  Session create({
    required SessionType type,
    required int durationMinutes,
    required double intensity,
    required String notes,
    String? opponent,
    int? scoreYou,
    int? scoreOpponent,
  }) {
    return Session(
      id: _uuid.v4(),
      date: DateTime.now(),
      type: type,
      durationMinutes: durationMinutes,
      intensity: intensity,
      notes: notes,
      opponent: opponent,
      scoreYou: scoreYou,
      scoreOpponent: scoreOpponent,
    );
  }
}
