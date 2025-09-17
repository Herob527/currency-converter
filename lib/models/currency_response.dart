import 'package:flutter_currency/models/currency_rate.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CurrencyResponseModel {
  String? table;
  String? no;
  String? effectiveDate;
  List<CurrencyRate> rates = [];
}
