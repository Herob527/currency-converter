// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyRate _$CurrencyRateFromJson(Map<String, dynamic> json) => CurrencyRate(
  currency: json['currency'] as String,
  mid: (json['mid'] as num).toDouble(),
  code: json['code'] as String,
);

Map<String, dynamic> _$CurrencyRateToJson(CurrencyRate instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'mid': instance.mid,
      'code': instance.code,
    };
