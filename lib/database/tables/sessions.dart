import 'package:drift/drift.dart';

class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get durationMinutes => integer()();
  RealColumn get intensity => real()(); // 0.0 → 1.0
  TextColumn get type => text()();      // "training", "match", etc.
  TextColumn get notes => text().nullable()();
}
