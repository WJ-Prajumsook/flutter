import 'dart:convert';

import 'package:currency_converter_app/model/chart.dart';
import 'package:currency_converter_app/model/currency.dart';
import 'package:currency_converter_app/model/currency_info.dart';
import 'package:currency_converter_app/model/exchange_rate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class CurrencyService {
  Dio _dio = Dio();

  Future<List<Currency>> getCurrencyList() async {
    try {
      final response = await rootBundle.loadString('assets/data/currency.json');
      var data = jsonDecode(response) as List;
      List<Currency> currencies = data.map((json) => Currency.fromJson(json)).toList();

      return currencies;
    } catch (error) {
      print(error);
      return List.empty();
    }
  }

  Future<List<CurrencyInfo>> getTrendingList() async {
    List<CurrencyInfo> list = [];
    list.add(await getCurrencyInfo('EUR'));
    list.add(await getCurrencyInfo('JPY'));
    list.add(await getCurrencyInfo('GBP'));
    list.add(await getCurrencyInfo('AUD'));
    list.add(await getCurrencyInfo('NZD'));

    return list;
  }

  Future<CurrencyInfo> getCurrencyInfo(String symbol) async {
    final String url = 'https://query2.finance.yahoo.com/v10/finance/quoteSummary/$symbol=X?modules=price,summaryDetail';
    try {
      final response = await _dio.get(url);
      final json = response.data['quoteSummary']['result'][0]['price'];
      CurrencyInfo info = CurrencyInfo.fromJson(json);

      final summary = response.data['quoteSummary']['result'][0]['summaryDetail'];
      String priceClose = summary['previousClose']['fmt'];
      String open = summary['open']['fmt'];
      String dayLow = summary['dayLow']['fmt'];
      String dayHigh = summary['dayHigh']['fmt'];
      SummaryDetail detail = SummaryDetail(
        previousClose: priceClose,
        open: open,
        dayLow: dayLow,
        dayHigh: dayHigh,
      );
      info.summaryDetail = detail;
      return info;
    } catch (error) {
      print(error);
      return CurrencyInfo();
    }
  }

  Future<ExchangeRate> getExchangeRate(String fromCurrency, String toCurrency, double amount) async {
    CurrencyInfo fromInfo = await getCurrencyInfo(fromCurrency);
    CurrencyInfo toInfo = await getCurrencyInfo(toCurrency);
    double baseFrom = fromInfo.marketPrice!.raw!.toDouble();
    double baseTo = toInfo.marketPrice!.raw!.toDouble();
    String oneToEquals = (baseFrom / baseTo).toStringAsFixed(4);
    String oneFromEquals = (baseTo / baseFrom).toStringAsFixed(4);
    String fromEquals = ((baseTo / baseFrom) * amount).toStringAsFixed(4);
    String toEquals = ((baseFrom / baseTo) * amount).toStringAsFixed(4);

    ExchangeRate rate = ExchangeRate(
      fromCurrency: fromInfo.currency,
      toCurrency: toInfo.currency,
      fromCurrencyRate: oneFromEquals,
      toCurrencyRate: oneToEquals,
      totalFromCurrencyRate: fromEquals,
      totalToCurrencyRate: toEquals,
    );

    rate.fromCurrencyInfo = fromInfo;
    rate.toCurrencyInfo = toInfo;

    return rate;
  }

  Future<List<Indicator>> getCurrencyChart(String symbol) async {
    final String fromDate = '1569880800';
    DateTime date = DateTime.now();
    var now = date.toUtc().millisecondsSinceEpoch;
    final String url = 'https://query2.finance.yahoo.com/v8/finance/chart/$symbol=X?symbol=$symbol=X&period1=$fromDate&period2=$now&useYfid=true&interval=1d&includePrePost=true';

    try {
      final response = await _dio.get(url);
      final timestamp = response.data['chart']['result'][0]['timestamp'] as List;
      final adjclose = response.data['chart']['result'][0]['indicators']['adjclose'][0]['adjclose'] as List;

      Indicator indicator = Indicator();
      List<Indicator> indicatorList = [];
      int index = 0;
      timestamp.forEach((element) {
        indicator = Indicator();
        indicator.timestamp = element;
        indicator.adjclose = adjclose[index];
        indicatorList.add(indicator);
        index++;
      });

      return indicatorList;
    } catch (error) {
      print(error);
      return List.empty();
    }
  }
}
