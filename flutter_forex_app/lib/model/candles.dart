class Candles {
  final String instrument;
  final List<Candle> candles;

  Candles({this.instrument, this.candles});

  factory Candles.fromJson(dynamic json) {
    if (json == null) {
      return Candles();
    }

    return Candles(
      instrument: json['instrument'],
      candles:
          (json['candles'] as List)?.map((c) => Candle.fromJson(c))?.toList() ??
              List.empty(),
    );
  }
}

class Candle {
  final bool complete;
  final int value;
  final String time;
  final CandleItem candleItem;

  Candle({this.complete, this.value, this.time, this.candleItem});

  factory Candle.fromJson(dynamic json) {
    if (json == null) {
      return Candle();
    }

    return Candle(
      complete: json['complete'],
      value: json['value'],
      time: json['time'],
      candleItem: CandleItem.fromJson(json['ask']),
    );
  }
}

class CandleItem {
  final String open;
  final String high;
  final String low;
  final String close;

  CandleItem({this.open, this.high, this.low, this.close});

  factory CandleItem.fromJson(dynamic json) {
    if (json == null) {
      return CandleItem();
    }

    return CandleItem(
      open: json['o'],
      high: json['h'],
      low: json['l'],
      close: json['c'],
    );
  }
}
