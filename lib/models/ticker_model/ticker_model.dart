import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticker_model.g.dart';

@JsonSerializable()
class TickerModel extends Equatable {
  final String ticker;
  final String name;
  final String market;
  final String locale;
  final bool active;
  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;
  @JsonKey(name: 'currency_name')
  final String currencyName;
  @JsonKey(name: 'base_currency_symbol')
  final String baseCurrencySymbol;
  @JsonKey(name: 'base_currency_name')
  final String baseCurrencyName;
  @JsonKey(name: 'last_updated_utc')
  final DateTime lastUpdatedUtc;

  const TickerModel({
    required this.ticker,
    required this.name,
    required this.market,
    required this.locale,
    required this.active,
    required this.currencySymbol,
    required this.currencyName,
    required this.baseCurrencySymbol,
    required this.baseCurrencyName,
    required this.lastUpdatedUtc,
  });

  factory TickerModel.fromJson(Map<String, dynamic> json) {
    return _$TickerModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TickerModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      ticker,
      name,
      market,
      locale,
      active,
      currencySymbol,
      currencyName,
      baseCurrencySymbol,
      baseCurrencyName,
      lastUpdatedUtc,
    ];
  }
}
