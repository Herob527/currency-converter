import 'dart:async';

import 'package:flutter_currency/models/currency.dart';

class CurrencyViewModel {
  final StreamController<Currency> _streamController =
      StreamController<Currency>();
  Stream<Currency> get currencyStream => _streamController.stream;

  void updateSmall(Currency currency, int newSmall) {
    Currency newCurrency = currency.withCurrency(newSmall: newSmall);
    _streamController.add(newCurrency);
  }

  void dispose() {
    _streamController.close();
  }
}
