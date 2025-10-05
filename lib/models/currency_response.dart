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

  factory CurrencyResponseModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return _$CurrencyResponseModelFromJson(json);
    }
    if (json is List<dynamic>) {
      return _$CurrencyResponseModelFromJson(json[0]);
    }
    throw Exception("Unsupported type: ${json.runtimeType}");
  }
}
