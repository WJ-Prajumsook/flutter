import 'package:flutter_forex_app/api/api.dart';
import 'package:flutter_forex_app/model/candles.dart';
import 'package:intl/intl.dart';

class CandlesRepository {
  Future<Candles> getCandles(String instrument, String granularity) async {
    final today = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
    final url =
        'https://api-fxpractice.oanda.com/v3/instruments/${instrument}/candles?granularity=$granularity&price=A&from=${today}T00:00&count=40';
    try {
      final response = await ApiRequest(url: url, data: null).get();
      print(response);
      return Candles.fromJson(response);
    } catch (error) {
      throw Exception('Exceptiob occured with error $error');
    }
  }
}
