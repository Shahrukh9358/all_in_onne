import 'package:drift/drift.dart';

class StocksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nseSymbol => text().nullable()();
  TextColumn get bseSymbol => text().nullable()();
  TextColumn get companyName => text().nullable()();
  TextColumn get isin => text().nullable()();
  RealColumn get price => real().nullable()();
  RealColumn get dayRangeLow => real().nullable()();
  RealColumn get dayRangeHigh => real().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}



