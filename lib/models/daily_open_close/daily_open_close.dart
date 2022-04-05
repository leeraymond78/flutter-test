import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_open_close.g.dart';

@JsonSerializable()
class DailyOpenClose extends Equatable {
  final String symbol;
  @JsonKey(name: 'isUTC')
  final bool isUtc;
  final DateTime day;
  final double open;
  final double close;

  const DailyOpenClose({
    required this.symbol,
    required this.isUtc,
    required this.day,
    required this.open,
    required this.close,
  });

  factory DailyOpenClose.fromJson(Map<String, dynamic> json) {
    return _$DailyOpenCloseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyOpenCloseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [symbol, isUtc, day, open, close];
}
