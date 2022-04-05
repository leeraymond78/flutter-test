import 'package:asklora_flutter_test/api/api_manager.dart';
import 'package:asklora_flutter_test/manager/ticker_manager.dart';
import 'package:flutter/material.dart';

import 'markets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Crypto Markets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    APIManager.tickers().then((value) {
      if (value != null) {
        setState(() {
          TickerManager.instance.tickers.clear();
          TickerManager.instance.tickers.addAll(value);
        });
        for (var e in TickerManager.instance.tickers) {
          var dailyOpenClose = TickerManager.instance
              .dailyOpenClose(e.baseCurrencySymbol, e.currencySymbol);
          if (dailyOpenClose == null) {
            APIManager.dailyOpenClose(e.baseCurrencySymbol, e.currencySymbol)
                .then((value) {
              if (value != null) {
                setState(() {
                  TickerManager.instance.dailyOpenCloseMap[TickerManager.symbol(
                      e.baseCurrencySymbol, e.currencySymbol)] = value;
                });
              }
            });
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _selectedIndex == 0
            ? MarketsPage(
                tickers: TickerManager.instance.tickers,
              )
            : MarketsPage(tickers: TickerManager.instance.favList),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex:
            _selectedIndex, // this will be set when a new tab is tapped
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Markets",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}
