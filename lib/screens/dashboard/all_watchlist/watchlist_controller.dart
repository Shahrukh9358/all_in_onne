import 'package:drift/drift.dart';
import 'package:get/get.dart'hide Value;
import 'package:realproject/data/api/stocks/stocks_items.dart';
import 'package:realproject/data/api/stocks/stocks_name.dart';
import 'package:realproject/data/local_database/db/app_database.dart';
import 'package:realproject/data/local_database/watchlist_table/watchlist_dao.dart';
import '../../../data/api/watchlist/WatchlistUser.dart';
import '../../../data/local_database/stocks_table/stocks_dao.dart';
import '../../../data/modals/Stocks.dart';

class WatchlistController extends GetxController {
  final WatchlistDao _watchlistDao = Get.find<AppDatabase>().watchlistDao;
  final  StocksDao _stocksDao   = Get.find<AppDatabase>().stocksDao;
  final UserWatchlist _userWatchlist =  Get.find<UserWatchlist>();
  final StocksApi _stocksApi = Get.find<StocksApi>();
  final SearchName _searchName = Get.find<SearchName>();

  final RxList<WatchlistTableData> watchlists = <WatchlistTableData>[].obs;
  final RxList<Stocks> stocks = <Stocks>[].obs;

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

  Future<void> _fetchStocks() async {
    try {
      var stocksData = await _stocksApi.getStocks();
      if (stocksData != null) {
        stocks.value = stocksData.map((stockData) => Stocks.fromJson(stockData)).toList();
      }
    } catch (e) {
      print('Error fetching stocks: $e');
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
    } catch (e) {
      print('Error adding stock to local database: $e');
    }
  }

  createWatchlist(String watchlistName, int userId) {
    _userWatchlist.createWatchlist(watchlistName, userId);
  }
}

