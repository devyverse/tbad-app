import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';

import 'tables/sessions.dart';
import 'dao/session_dao.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File('app.db'); // tu peux changer le chemin si besoin
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [Sessions],
  daos: [SessionDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
