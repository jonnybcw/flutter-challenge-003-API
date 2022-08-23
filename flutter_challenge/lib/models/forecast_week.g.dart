// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeek _$ForecastWeekFromJson(Map<String, dynamic> json) => ForecastWeek(
      days: (json['days'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastWeekToJson(ForecastWeek instance) =>
    <String, dynamic>{
      'days': instance.days,
    };
