import 'package:asklora_flutter_test/api/api_manager.dart';
import 'package:asklora_flutter_test/manager/ticker_manager.dart';

import 'package:asklora_flutter_test/models/daily_open_close/daily_open_close_extension.dart';

import 'package:asklora_flutter_test/models/ticker_model/ticker_model.dart';
import 'package:flutter/material.dart';

class MarketsPage extends StatefulWidget {
  List<TickerModel> tickers;
  MarketsPage({Key? key, required this.tickers}) : super(key: key);

  @override
  State<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
          child: SizedBox(
        width: double.infinity,
        child: DataTable(
          columnSpacing: 0,
          columns: const [
            DataColumn(label: Text('Fav')),
            DataColumn(label: Text('Pair')),
            DataColumn(label: Text('price'), numeric: true),
            DataColumn(label: Text('change'), numeric: true)
          ],
          rows: widget.tickers.map((ticker) => dataRow(ticker)).toList(),
        ),
      )),
    );
  }

  DataRow dataRow(TickerModel ticker) {
    return DataRow(cells: [
      DataCell(IconButton(
          onPressed: () {
            final removed = TickerManager.instance.favList.remove(ticker);

            if (!removed) {
              TickerManager.instance.favList.add(ticker);
            }
            setState(() {});
          },
          icon: Icon(TickerManager.instance.favList.contains(ticker)
              ? Icons.favorite
              : Icons.favorite_outline))),
      DataCell(Text(ticker.baseCurrencySymbol + '/' + ticker.currencySymbol)),
      DataCell(Text(TickerManager.instance
              .dailyOpenClose(ticker.baseCurrencySymbol, ticker.currencySymbol)
              ?.close
              .toString() ??
          'N/A')),
      DataCell(Text((TickerManager.instance
                  .dailyOpenClose(
                      ticker.baseCurrencySymbol, ticker.currencySymbol)
                  ?.changeInPercent
                  ?.toStringAsFixed(2) ??
              '0') +
          '%'))
    ]);
  }
}
