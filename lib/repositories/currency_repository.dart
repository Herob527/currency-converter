import 'dart:convert';

import 'package:flutter_currency/main.dart';
import 'package:flutter_currency/models/currency_response.dart';

const apiUrl = "https://api.nbp.pl/api/exchangerates/tables/A?format=json";

class CurrencyRepository {
  Future<CurrencyResponseModel?> getCurrencies() async {
    var response = await dio.get<String>(apiUrl);
    var data = response.data;
    if (data == null) {
      return Future.value(null);
    }
    var decoded = CurrencyResponseModel.fromJson(json.decode(data));
    return decoded;
  }
}
