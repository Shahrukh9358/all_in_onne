import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;
import 'package:realproject/data/api/stocks/stocks_name.dart';
import 'package:realproject/data/local_database/db/app_database.dart';
import 'package:realproject/data/local_database/watchlist_table/watchlist_dao.dart';
import '../../../data/api/watchlist/WatchlistUser.dart';
import '../../../data/local_database/stocks_table/stocks_dao.dart';
import '../../../data/modals/Stocks.dart';

class WatchlistController extends GetxController {
  final WatchlistDao _watchlistDao = Get.find<AppDatabase>().watchlistDao;
  final StocksDao _stocksDao = Get.find<AppDatabase>().stocksDao;
  final UserWatchlist _userWatchlist = Get.find<UserWatchlist>();
  final SearchName _searchName = Get.find<SearchName>();

  final RxList<WatchlistTableData> watchlists = <WatchlistTableData>[].obs;
  final RxList<Stocks> stocks = <Stocks>[].obs;
  final RxInt stocksCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _fetchWatchlists();
    _fetchStocks();
  }

  void _fetchWatchlists() {
    _watchlistDao.watchAllWatchlists().listen((watchlistItems) {
      watchlists.assignAll(watchlistItems);
    }).onError((e) {
      print('Error fetching watchlists: $e');
    });
  }

  void _fetchStocks() {
    _stocksDao.watchAllStocks().listen((localStocks) {
      // Convert StocksTableData to Stocks
      List<Stocks> convertedStocks = localStocks.map((stockTableData) {
        return Stocks(
          nseSymbol: stockTableData.nseSymbol,
          bseSymbol: stockTableData.bseSymbol,
          companyName: stockTableData.companyName,
          isin: stockTableData.isin,
          price: stockTableData.price,
          dayRangeLow: stockTableData.dayRangeLow,
          dayRangeHigh: stockTableData.dayRangeHigh,
          updatedAt: stockTableData.updatedAt?.toIso8601String(),
        );
      }).toList();
      stocksCount.value = stocks.length;
      stocks.assignAll(convertedStocks);
    }).onError((e) {
      print('Error fetching stocks from local: $e');
    });
  }

  Future<void> _fetchStocksFromLocal() async {
    try {
      var localStocks = await _stocksDao.getAllStocks();
      // Convert StocksTableData to Stocks
      List<Stocks> convertedStocks = localStocks.map((stockTableData) {
        return Stocks(
          nseSymbol: stockTableData.nseSymbol,
          bseSymbol: stockTableData.bseSymbol,
          companyName: stockTableData.companyName,
          isin: stockTableData.isin,
          price: stockTableData.price,
          dayRangeLow: stockTableData.dayRangeLow,
          dayRangeHigh: stockTableData.dayRangeHigh,
          updatedAt: stockTableData.updatedAt?.toIso8601String(),
        );
      }).toList();
      stocks.assignAll(convertedStocks);
    } catch (e) {
      print('Error fetching stocks from local: $e');
    }
  }

  Future<void> searchStockByName(String stockName) async {
    try {
      var stockData = await _searchName.getName(stockName);
      if (stockData != null) {
        List<Stocks> _stocks = stockData.map<Stocks>((s) => Stocks.fromJson(s)).toList();
        stocks.value = _stocks;
      } else {
        stocks.clear();
      }
    } catch (e) {
      print('Error searching stock: $e');
    }
  }

  Future<void> addStockToLocalDatabase(Stocks stock) async {
    try {
      final newStock = StocksTableCompanion(
        nseSymbol: Value(stock.nseSymbol),
        bseSymbol: Value(stock.bseSymbol),
        companyName: Value(stock.companyName),
        isin: Value(stock.isin),
        price: Value(stock.price?.toDouble()),
        dayRangeLow: Value(stock.dayRangeLow?.toDouble()),
        dayRangeHigh: Value(stock.dayRangeHigh?.toDouble()),
        updatedAt: Value(stock.updatedAt != null ? DateTime.parse(stock.updatedAt!) : null),
      );
      await _stocksDao.insertStock(newStock);
      print('Stock added to local database: ${stock.companyName}');

      // Fetch the updated list of stocks from local database
      await _fetchStocksFromLocal();
    } catch (e) {
      print('Error adding stock to local database: $e');
    }
  }

  createWatchlist(String watchlistName, int userId) {
    _userWatchlist.createWatchlist(watchlistName, userId);
  }


}
