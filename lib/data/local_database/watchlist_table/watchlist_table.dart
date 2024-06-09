import 'package:drift/drift.dart';
class WatchlistTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get watchlistName => text().nullable()();
  IntColumn get watchlistId => integer()();
  IntColumn get userId => integer()();
}
