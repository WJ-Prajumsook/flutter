import 'package:flutter_forex_app/api/api.dart';
import 'package:flutter_forex_app/model/price.dart';

class PriceRepository {
  final String accountNr = 'YOUR_OANDA_ACCOUNT_NUMBER';
  final String instruments =
      'EUR_USD,GBP_USD,USD_JPY,AUD_USD,EUR_GBP,USD_CAD,USD_CHF,NZD_CHF,USD_HKD,USD_SGD';

  Future<List<Price>> getPriceList() async {
    final url =
        'https://api-fxpractice.oanda.com/v3/accounts/$accountNr/pricing?instruments=$instruments';
    final response = await ApiRequest(url: url).get();
    List<Price> prices =
        (response['prices'] as List)?.map((p) => Price.fromJson(p))?.toList() ??
            List.empty();
    print(response);
    return prices;
  }

  Future<Price> getPrice(String instrument) async {
    final url =
        'https://api-fxpractice.oanda.com/v3/accounts/$accountNr/pricing?instruments=$instrument';
    final response = await ApiRequest(url: url).get();
    print(response);
    return Price.fromJson(response['prices'][0]);
  }
}
