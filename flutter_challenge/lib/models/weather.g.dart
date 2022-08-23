// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      title: json['title'] as String,
      forecast: json['forecast'] as String,
      currentTemperature: json['temp'] as int?,
      maxTemperature: json['max_temp'] as int,
      minTemperature: json['min_temp'] as int,
      windSpeed: json['wind_speed'] as int,
      humidity: json['humidity'] as int,
      precipitation: json['precipitation'] as int,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'title': instance.title,
      'forecast': instance.forecast,
      'temp': instance.currentTemperature,
      'max_temp': instance.maxTemperature,
      'min_temp': instance.minTemperature,
      'wind_speed': instance.windSpeed,
      'humidity': instance.humidity,
      'precipitation': instance.precipitation,
    };
