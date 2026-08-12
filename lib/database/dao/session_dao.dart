import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/sessions.dart';

part 'session_dao.g.dart';

@DriftAccessor(tables: [Sessions])
class SessionDao extends DatabaseAccessor<AppDatabase> with _$SessionDaoMixin {
  SessionDao(AppDatabase db) : super(db);

  Future<int> insertSession({
    required DateTime date,
    required int durationMinutes,
    required double intensity,
    required String type,
    String? notes,
  }) {
    return into(sessions).insert(
      SessionsCompanion.insert(
        date: date,
        durationMinutes: durationMinutes,
        intensity: intensity,
        type: type,
        notes: Value(notes),
      ),
    );
  }

  Future<List<Session>> getAllSessions() {
    return select(sessions).get();
  }

  Future<List<Session>> getSessionsSince(DateTime from) {
    return (select(sessions)
          ..where((s) => s.date.isBiggerOrEqualValue(from))
          ..orderBy([(s) => OrderingTerm.asc(s.date)]))
        .get();
  }

  Future<int> deleteSession(int id) {
    return (delete(sessions)..where((s) => s.id.equals(id))).go();
  }
}
