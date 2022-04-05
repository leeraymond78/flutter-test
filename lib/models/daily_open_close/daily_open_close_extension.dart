import 'package:asklora_flutter_test/models/daily_open_close/daily_open_close.dart';

extension DailyOpenCloseExtension on DailyOpenClose {
  double? get change {
    if (close == 0) {
      return 0;
    }
    return (close - open) / open;
  }

  double? get changeInPercent => change ?? 0 * 100;
}
