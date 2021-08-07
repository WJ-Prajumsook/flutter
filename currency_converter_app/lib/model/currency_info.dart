class CurrencyInfo {
  final MarketPrice? marketPrice;
  final MarketChange? marketChange;
  final MarketChangePercent? marketChangePercent;
  final int? regularMarketTime;
  final String? shorName;
  final String? currencySymbol;
  final String? currency;
  SummaryDetail? summaryDetail;

  CurrencyInfo({
    this.marketPrice,
    this.marketChange,
    this.marketChangePercent,
    this.regularMarketTime,
    this.shorName,
    this.currencySymbol,
    this.currency,
  });

  factory CurrencyInfo.fromJson(dynamic json) {
    return CurrencyInfo(
      marketPrice: MarketPrice.fromJson(json['regularMarketPrice']),
      marketChange: MarketChange.fromJson(json['regularMarketChange']),
      marketChangePercent: MarketChangePercent.fromJson(json['regularMarketChangePercent']),
      regularMarketTime: json['regularMarketTime'],
      shorName: json['shortName'],
      currencySymbol: json['currencySymbol'],
      currency: json['currency'],
    );
  }
}

class MarketPrice {
  final double? raw;
  final String? fmt;

  MarketPrice({
    this.raw,
    this.fmt,
  });

  factory MarketPrice.fromJson(dynamic json) {
    return MarketPrice(
      raw: json['raw'],
      fmt: json['fmt'],
    );
  }
}

class MarketChange {
  final double? raw;
  final String? fmt;

  MarketChange({
    this.raw,
    this.fmt,
  });

  factory MarketChange.fromJson(dynamic json) {
    return MarketChange(
      raw: json['raw'],
      fmt: json['fmt'],
    );
  }
}

class MarketChangePercent {
  final double? raw;
  final String? fmt;

  MarketChangePercent({
    this.raw,
    this.fmt,
  });

  factory MarketChangePercent.fromJson(dynamic json) {
    return MarketChangePercent(
      raw: json['raw'],
      fmt: json['fmt'],
    );
  }
}

class SummaryDetail {
  final String? previousClose;
  final String? open;
  final String? dayLow;
  final String? dayHigh;

  SummaryDetail({
    this.previousClose,
    this.open,
    this.dayLow,
    this.dayHigh,
  });
}
