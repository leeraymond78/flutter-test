import 'package:asklora_flutter_test/models/daily_open_close/daily_open_close.dart';
import 'package:asklora_flutter_test/models/ticker_model/ticker_model.dart';

class TickerManager {
  static TickerManager? _instance;
  List<TickerModel> favList = [];
  List<TickerModel> tickers = [];
  Map<String, DailyOpenClose> dailyOpenCloseMap = {};

  static String symbol(String baseUnit, String quoteUnit) {
    return '$baseUnit-$quoteUnit';
  }

  DailyOpenClose? dailyOpenClose(String baseUnit, String quoteUnit) {
    return dailyOpenCloseMap[symbol(baseUnit, quoteUnit)];
  }

  TickerManager._();
  static TickerManager get instance => _instance ??= TickerManager._();
}
