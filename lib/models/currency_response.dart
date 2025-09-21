import 'package:flutter_currency/models/currency_rate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_response.g.dart';

@JsonSerializable()
class CurrencyResponseModel {
  String? table;
  String? no;
  String? effectiveDate;
  List<CurrencyRate> rates = [];

  CurrencyResponseModel({
    this.table,
    this.no,
    this.effectiveDate,
    this.rates = const [],
  });

  factory CurrencyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseModelFromJson(json);
}
