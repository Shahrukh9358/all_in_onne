import 'dart:developer';
import 'package:drift/drift.dart';
import 'package:realproject/data/local_database/watchlist_table/watchlist_table.dart';
import '../db/app_database.dart';
part 'watchlist_dao.g.dart';

@DriftAccessor(tables: [WatchlistTable])
class WatchlistDao extends DatabaseAccessor<AppDatabase> with _$WatchlistDaoMixin {
  WatchlistDao(AppDatabase db) : super(db);

  Future<WatchlistTableData?> getWatchlistById(int id) async {
    try {
      return (select(watchlistTable)..where((w) => w.id.equals(id))).getSingleOrNull();
    } catch (e) {
      log('Error getting watchlist by ID: $e');
      return null;
    }
  }

  Future<List<WatchlistTableData>> getAllWatchlists() async {
    try {
      return select(watchlistTable).get();
    } catch (e) {
      log('Error getting all watchlists: $e');
      return [];
    }
  }

  Stream<List<WatchlistTableData>> watchAllWatchlists() {
    try {
      return select(watchlistTable).watch();
    } catch (e) {
      log('Error watching all watchlists: $e');
      return Stream.empty();
    }
  }

  Future<int> insertWatchlist(WatchlistTableCompanion watchlist) async {
    try {
      // Logging the values to ensure all required fields are present
      log('Inserting watchlist: ${watchlist.watchlistName.value}, ${watchlist.userId.value}');

      // Check if required values are present
      if (watchlist.watchlistName.present && watchlist.watchlistId.present && watchlist.userId.present) {
        return into(watchlistTable).insert(watchlist);
      } else {
        log('Error: Missing required values in watchlist');
        return -1;
      }
    } catch (e) {
      log('Error inserting watchlist: $e');
      return -1;
    }
  }

  Future<int> updateWatchlist(int id, String newName) async {
    try {
      final updateCount = await (update(watchlistTable)..where((w) => w.id.equals(id)))
          .write(WatchlistTableCompanion(watchlistName: Value(newName)));
      log('Number of rows updated: $updateCount');
      return updateCount;
    } catch (e) {
      log('Error updating watchlist: $e');
      return -1;
    }
  }

  Future<int> deleteWatchlist(WatchlistTableData watchlist) async {
    try {
      return delete(watchlistTable).delete(watchlist);
    } catch (e) {
      log('Error deleting watchlist: $e');
      return -1;
    }
  }
}
