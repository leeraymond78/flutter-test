// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_open_close.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyOpenClose _$DailyOpenCloseFromJson(Map<String, dynamic> json) =>
    DailyOpenClose(
      symbol: json['symbol'] as String,
      isUtc: json['isUTC'] as bool,
      day: DateTime.parse(json['day'] as String),
      open: (json['open'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyOpenCloseToJson(DailyOpenClose instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'isUTC': instance.isUtc,
      'day': instance.day.toIso8601String(),
      'open': instance.open,
      'close': instance.close,
    };
