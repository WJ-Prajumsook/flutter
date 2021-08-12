import 'package:cryptocurrencies_dashboard_app/model/volume_data.dart';

class Quote {
  String? symbol;
  String? fromCurrency;
  String? toCurrency;
  String? shortName;
  String? coinImageUrl;
  String? currency;
  VolumeData? regularMarketDayHigh;
  VolumeData? regularMarketChange;
  VolumeData? regularMarketChangePercent;
  VolumeData? regularMarketDayLow;
  VolumeData? regularMarketOpen;
  VolumeData? regularMarketPreviousClose;
  VolumeData? regularMarketPrice;
  VolumeAllCurrencies? regularMarketTime;
  VolumeAllCurrencies? volumeAllCurrencies;

  Quote({
    this.symbol,
    this.fromCurrency,
    this.toCurrency,
    this.shortName,
    this.coinImageUrl,
    this.currency,
    this.regularMarketDayHigh,
    this.regularMarketChange,
    this.regularMarketChangePercent,
    this.regularMarketDayLow,
    this.regularMarketOpen,
    this.regularMarketPreviousClose,
    this.regularMarketPrice,
    this.regularMarketTime,
    this.volumeAllCurrencies,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      symbol: json['symbol'],
      fromCurrency: json['fromCurrency'],
      toCurrency: json['toCurrency'],
      shortName: json['shortName'],
      coinImageUrl: json['coinImageUrl'],
      currency: json['currency'],
      regularMarketDayHigh: VolumeData.fromJson(json['regularMarketDayHigh']),
      regularMarketChange: VolumeData.fromJson(json['regularMarketChange']),
      regularMarketChangePercent: VolumeData.fromJson(json['regularMarketChangePercent']),
      regularMarketDayLow: VolumeData.fromJson(json['regularMarketDayLow']),
      regularMarketOpen: VolumeData.fromJson(json['regularMarketOpen']),
      regularMarketPreviousClose: VolumeData.fromJson(json['regularMarketPreviousClose']),
      regularMarketPrice: VolumeData.fromJson(json['regularMarketPrice']),
      regularMarketTime: VolumeAllCurrencies.fromJson(json['regularMarketTime']),
      volumeAllCurrencies: VolumeAllCurrencies.fromJson(json['volumeAllCurrencies']),
    );
  }
}

class VolumeAllCurrencies {
  int? raw;
  String? fmt;

  VolumeAllCurrencies({
    this.raw,
    this.fmt,
  });

  factory VolumeAllCurrencies.fromJson(Map<String, dynamic> json) {
    return VolumeAllCurrencies(
      raw: json['raw'],
      fmt: json['fmt'],
    );
  }
}