//TODO: Add your imports here.
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '0AC995DA-21EB-4203-ADA4-2226EB8209E8';
const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  //TODO: Create your getCoinData() method here.

  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrice = {};
    for (String crypto in cryptoList) {
      String url = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        double lastPrice = decodeData['rate'];
        cryptoPrice[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request.';
      }
    }
    return cryptoPrice;
  }
}
