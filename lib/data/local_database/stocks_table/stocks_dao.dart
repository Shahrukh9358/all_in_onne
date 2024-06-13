import 'package:drift/drift.dart';
import 'package:realproject/data/local_database/stocks_table/stocks_table.dart';
import '../db/app_database.dart';
part 'stocks_dao.g.dart';

@DriftAccessor(tables: [StocksTable])
class StocksDao extends DatabaseAccessor<AppDatabase> with _$StocksDaoMixin {
  StocksDao(AppDatabase db) : super(db);

  Future<List<StocksTableData>> getAllStocks() => select(stocksTable).get();
  Stream<List<StocksTableData>> watchAllStocks() => select(stocksTable).watch();
  Future<void> insertStock(StocksTableCompanion stock) => into(stocksTable).insert(stock);
  Future<bool> updateStock(Insertable<StocksTableData> stock) => update(stocksTable).replace(stock);
  Future<int> deleteStock(Insertable<StocksTableData> stock) => delete(stocksTable).delete(stock);
}

