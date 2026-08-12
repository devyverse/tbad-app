import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

Future<QueryExecutor> connect() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File(p.join(dir.path, 'trackerbad.sqlite'));
  return NativeDatabase(file);
}
