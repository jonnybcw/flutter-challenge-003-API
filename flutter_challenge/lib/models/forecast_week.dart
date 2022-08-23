import 'package:flutter_challenge/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_week.g.dart';

@JsonSerializable()
class ForecastWeek {
  ForecastWeek({
    required this.days,
  });

  final List<Weather> days;

  factory ForecastWeek.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeekFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastWeekToJson(this);
}
