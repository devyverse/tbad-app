/*import '../database/database.dart';
final appDatabase = AppDatabase();

await appDatabase.sessionDao.insertSession(
  date: DateTime.now(),
  durationMinutes: 75,
  intensity: 0.8,
  type: "training",
  notes: "Bonne séance",
);

final now = DateTime.now();
final from = now.subtract(const Duration(days: 7));

final sessions = await appDatabase.sessionDao.getSessionsSince(from);

await appDatabase.sessionDao.deleteSession(id);
*/

import '../database/database.dart';

final appDatabase = AppDatabase();

