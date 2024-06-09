import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:realproject/data/local_database/watchlist_table/watchlist_table.dart';
import 'package:realproject/data/local_database/watchlist_table/watchlist_dao.dart';
import 'package:realproject/data/local_database/user_table/user_table.dart';
import 'package:realproject/data/local_database/user_table/user_dao.dart';
part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users, WatchlistTable], daos: [UserDao, WatchlistDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
