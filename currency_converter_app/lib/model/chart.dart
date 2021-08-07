class Chart {
  List<Indicator>? indicators;

  Chart({this.indicators});
}

class Indicator {
  int? timestamp;
  double? adjclose;
  double? high;
  double? low;
  double? open;
  double? close;

  Indicator({
    this.timestamp,
    this.adjclose,
    this.high,
    this.low,
    this.open,
    this.close,
  });
}
