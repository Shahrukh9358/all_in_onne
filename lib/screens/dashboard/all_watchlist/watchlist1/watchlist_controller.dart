import 'dart:developer';
import 'package:get/get.dart'hide value;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:realproject/data/api/stocks/stocks_items.dart';
import 'package:realproject/data/api/stocks/stocks_name.dart';
import 'package:realproject/data/api/watchlist/WatchlistUser.dart';
import 'package:realproject/data/local_database/db/app_database.dart';
import 'package:realproject/data/local_database/watchlist_table/watchlist_dao.dart';

import '../../../../data/modals/Stocks.dart';

class WatchlistController extends GetxController {
  final WatchlistDao _watchlistDao = Get.find<AppDatabase>().watchlistDao;
  final UserWatchlist _userWatchlist =  Get.find<UserWatchlist>();
  final StocksApi _stocksApi   =  Get.find<StocksApi>();
  final SearchName _searchName = Get.find<SearchName>();


  RxList<WatchlistTableData> watchlists = <WatchlistTableData>[].obs;
  RxList<Stocks> stocks = <Stocks>[].obs;
  @override
  void onInit() {
    super.onInit();
    _fetchWatchlists();
    _fetchStocks();
  }

  void _fetchWatchlists() {
    _watchlistDao.watchAllWatchlists().listen((watchlistItems) {
      log('Stream fetched watchlists: $watchlistItems');
      watchlists.value = watchlistItems;
      print("list me data aa rha hai${watchlists.toString()}");
      log("controller tak value aa rhi hai");
    }).onError((e) {
      log('Error fetching watchlists: $e');

    });
  }
  Future<void> _fetchStocks() async {
    try {
      var stocksData = await _stocksApi.getStocks();
      if (stocksData != null) {
        List<Stocks> stocksList = [];
        log("list me data aa rha hai");
        for (var stockData in stocksData) {
          stocksList.add(Stocks.fromJson(stockData));
        }
        stocks.value = stocksList;
      }
    } catch (e,s) {
      log('Error fetching stocks: $e,$s');
    }
  }

  createWatchlist(String watchlistName, int userId) {
    _userWatchlist.createWatchlist(watchlistName, userId);
  }

  Future<void> searchStockByName(String stockName) async {
    try {
      var stockData = await _searchName.getName(stockName);
      if (stockData != null) {
        Stocks stock = Stocks.fromJson(stockData);
        log('Found stock: ${stock.toString()}');
        // Aap yahan further logic implement kar sakte hain, jaise ki stock ko list me add karna ya UI update karna.
      } else {
        log('No stock data found for $stockName');
      }
    } catch (e) {
      log('Error searching stock: $e');
    }
  }

}
