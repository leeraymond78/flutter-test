import 'dart:convert';
import 'dart:io';

import 'package:asklora_flutter_test/models/daily_open_close/daily_open_close.dart';
import 'package:asklora_flutter_test/models/ticker_model/ticker_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

const apiKey = 'HMbSNDroKcx2AEKAeG38LKUPwC3SaEWq';

class APIManager {
  static Future<List<TickerModel>?> tickers() async {
    final params = {
      'market': 'crypto',
      'active': 'true',
      'sort': 'ticker',
      'order': 'asc',
      'limit': '15',
    };
    final url = Uri.https("api.polygon.io", "/v3/reference/tickers", params);
    debugPrint('Calling $url');
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    debugPrint('response of $url');
    debugPrint(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var obj = json.decode(response.body) as Map<String, dynamic>;
      var data = obj['results'] as List<dynamic>;
      return data.map((e) => TickerModel.fromJson(e)).toList();
    } else {
      debugPrint('Failed to load tickers');
    }
    return null;
  }

  static Future<DailyOpenClose?> dailyOpenClose(
      String baseUnit, String quoteUnit) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    final url = Uri.https("api.polygon.io",
        "/v1/open-close/crypto/$baseUnit/$quoteUnit/$formatted");
    debugPrint('Calling $url');
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    debugPrint('response of $url code:${response.statusCode}');
    debugPrint(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var obj = json.decode(response.body) as Map<String, dynamic>;
      return DailyOpenClose.fromJson(obj);
    } else {
      debugPrint('Failed to load dailyOpenClose');
    }
    return null;
  }
}
