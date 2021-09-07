import 'package:bitcoin_ticker_flutter/data/coin_data.dart';
import 'package:bitcoin_ticker_flutter/services/networking.dart';
import 'package:bitcoin_ticker_flutter/utilities/constants.dart';

class ExchangeCurrency {
  CoinData coinData = CoinData();

  Future getAllCurrencyData(String selectedCurrency) async {
    List<dynamic> list = [];
    for (int i = 0; i < 3; i++) {
      var data = await getCurrencyRates(i, selectedCurrency);
      double currencyBTC = data['rate'];
      int currency = currencyBTC.toInt();
      list.add(currency);
    }
    return list;
  }

  Future getCurrencyRates(int selected, String selectedCurrency) async {
    var urlString =
        '$IP/${coinData.cryptoList[selected]}/$selectedCurrency?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url: urlString);
    return await networkHelper.getData();
  }
}
