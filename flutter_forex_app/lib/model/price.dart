import 'package:flutter_forex_app/model/asks.dart';
import 'package:flutter_forex_app/model/bids.dart';

class Price {
  final String type;
  final String time;
  final Bids bids;
  final Asks asks;
  final String closeoutBid;
  final String closeoutAsk;
  final bool tradeable;
  final String instrument;

  Price(
      {this.type,
      this.time,
      this.bids,
      this.asks,
      this.closeoutBid,
      this.closeoutAsk,
      this.tradeable,
      this.instrument});

  factory Price.fromJson(dynamic json) {
    if (json == null) {
      return Price();
    }

    return Price(
      type: json['type'],
      time: json['time'],
      closeoutBid: json['closeoutBid'],
      closeoutAsk: json['closeoutAsk'],
      tradeable: json['tradeable'],
      instrument: json['instrument'],
    );
  }
}
