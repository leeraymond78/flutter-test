// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TickerModel _$TickerModelFromJson(Map<String, dynamic> json) => TickerModel(
      ticker: json['ticker'] as String,
      name: json['name'] as String,
      market: json['market'] as String,
      locale: json['locale'] as String,
      active: json['active'] as bool,
      currencySymbol: json['currency_symbol'] as String,
      currencyName: json['currency_name'] as String,
      baseCurrencySymbol: json['base_currency_symbol'] as String,
      baseCurrencyName: json['base_currency_name'] as String,
      lastUpdatedUtc: DateTime.parse(json['last_updated_utc'] as String),
    );

Map<String, dynamic> _$TickerModelToJson(TickerModel instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'name': instance.name,
      'market': instance.market,
      'locale': instance.locale,
      'active': instance.active,
      'currency_symbol': instance.currencySymbol,
      'currency_name': instance.currencyName,
      'base_currency_symbol': instance.baseCurrencySymbol,
      'base_currency_name': instance.baseCurrencyName,
      'last_updated_utc': instance.lastUpdatedUtc.toIso8601String(),
    };
