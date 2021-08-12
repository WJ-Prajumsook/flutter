import 'dart:convert';

import 'package:cryptocurrencies_dashboard_app/model/indicator.dart';
import 'package:cryptocurrencies_dashboard_app/model/quote.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoProvider extends ChangeNotifier {

  // Get trending currencies.
  Future<List<String>> fetchTrendingTickers(int count) async {
    final String url = 'https://query2.finance.yahoo.com/v1/finance/trending/US?count=$count';
    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final quote = json['finance']['result'][0]['quotes'] as List;
        List<String> list = [];
        quote.forEach((element) {
          list.add(element['symbol']);
        });

        return list;
      } else {
        print('Error loading data');
        return List.empty();
      }
    } catch(error) {
      print(error);
      return List.empty();
    }
  }

  // Fetch Quote Chart Data
  Future<List<Indicator>> fetchChartData(String symbol) async {
    final String url =
        'https://query2.finance.yahoo.com/v7/finance/spark?symbols=$symbol&range=1d&interval=5m&indicators=close&includeTimestamps=false&includePrePost=false';

    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final timestampList = json['spark']['result'][0]['response'][0]['timestamp'] as List;
        final closeList = json['spark']['result'][0]['response'][0]['indicators']['quote'][0]['close'] as List;
        final symbol = json['spark']['result'][0]['response'][0]['meta']['symbol'];
        final timezone = json['spark']['result'][0]['response'][0]['meta']['timezone'];
        List<Indicator> indicators = [];

        int index = 0;
        timestampList.forEach((element) {
          Indicator ind = Indicator(
            timestamp: element,
            close: closeList[index],
            symbol: symbol,
            timezone: timezone,
          );
          indicators.add(ind);
          index++;
        });

        return indicators;
      } else {
        print('Error loading data');
        return List.empty();
      }
    } catch(error) {
      print(error);
      return List.empty();
    }
  }

  Future<List<Quote>> fetchQuote(int count) async {
    final String url = 'https://query2.finance.yahoo.com/v1/finance/screener/predefined/saved?formatted=true&scrIds=all_cryptocurrencies_us&start=0&count=$count';
    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final data = json['finance']['result'][0]['quotes'] as List;
        List<Quote> list = data.map((q) => Quote.fromJson(q)).toList();

        return list;
      } else {
        print('Error loading data');
        return List.empty();
      }
    } catch(error) {
      print(error);
      return List.empty();
    }
  }

}