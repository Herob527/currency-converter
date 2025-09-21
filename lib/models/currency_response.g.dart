// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponseModel _$CurrencyResponseModelFromJson(
  Map<String, dynamic> json,
) => CurrencyResponseModel(
  table: json['table'] as String?,
  no: json['no'] as String?,
  effectiveDate: json['effectiveDate'] as String?,
  rates:
      (json['rates'] as List<dynamic>?)
          ?.map((e) => CurrencyRate.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CurrencyResponseModelToJson(
  CurrencyResponseModel instance,
) => <String, dynamic>{
  'table': instance.table,
  'no': instance.no,
  'effectiveDate': instance.effectiveDate,
  'rates': instance.rates,
};
