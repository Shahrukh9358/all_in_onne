import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get localId => integer().autoIncrement()(); // Locally maintained ID
  IntColumn get id => integer()(); // Online ID from the online database
  TextColumn get fullName => text()();
  TextColumn get email => text().unique()();
  TextColumn get createWatchlist => text().nullable()(); // New column for watchlist
}

