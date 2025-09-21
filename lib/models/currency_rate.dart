import 'package:json_annotation/json_annotation.dart';

part 'currency_rate.g.dart';

@JsonSerializable()
class CurrencyRate {
  final String currency;
  final double mid;
  final String code;

  CurrencyRate({required this.currency, required this.mid, required this.code});

  factory CurrencyRate.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateFromJson(json);
}
