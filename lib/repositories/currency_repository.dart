import 'dart:convert';

import 'package:flutter_currency/main.dart';
import 'package:flutter_currency/models/currency_response.dart';

const ApiUrl = "https://api.nbp.pl/api/exchangerates/tables/A?format=json";

class CurrencyRepository {
  getCurrencies() async {
    var response = await dio.get<String>(ApiUrl);
    var decoded = json.decode(response.data ?? "{}");
    return response.data;
  }
}

final currencyRepository = CurrencyRepository();
