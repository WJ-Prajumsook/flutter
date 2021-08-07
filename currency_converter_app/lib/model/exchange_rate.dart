import 'package:currency_converter_app/model/currency_info.dart';

class ExchangeRate {
  final String? fromCurrency;
  final String? toCurrency;
  final String? fromCurrencyRate;
  final String? toCurrencyRate;
  final String? totalFromCurrencyRate;
  final String? totalToCurrencyRate;
  CurrencyInfo? fromCurrencyInfo;
  CurrencyInfo? toCurrencyInfo;

  ExchangeRate({
    this.fromCurrency,
    this.toCurrency,
    this.fromCurrencyRate,
    this.toCurrencyRate,
    this.totalFromCurrencyRate,
    this.totalToCurrencyRate,
  });
}
