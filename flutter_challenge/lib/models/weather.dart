import 'package:flutter_challenge/models/weather_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather({
    required this.title,
    required this.forecast,
    required this.currentTemperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.windSpeed,
    required this.humidity,
    required this.precipitation,
  }) {
    currentWeatherStatus = addWeatherStatus();
  }

  final String title;
  final String forecast;
  @JsonKey(name: 'temp')
  final int? currentTemperature;
  @JsonKey(name: 'max_temp')
  final int maxTemperature;
  @JsonKey(name: 'min_temp')
  final int minTemperature;
  @JsonKey(name: 'wind_speed')
  final int windSpeed;
  final int humidity;
  final int precipitation;
  @JsonKey(ignore: true)
  late WeatherStatus currentWeatherStatus;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  WeatherStatus addWeatherStatus() {
    switch (forecast) {
      case ('Sunny'):
        return WeatherStatus.sunny;
      case ('Partly cloudy'):
        return WeatherStatus.partlyCloudy;
      case ('Mostly cloudy'):
        return WeatherStatus.mostlyCloudy;
      case ('Cloudy'):
        return WeatherStatus.cloudy;
      case ('Showers'):
        return WeatherStatus.showers;
      case ('Rain'):
        return WeatherStatus.rain;
      case ('Thunderstorm'):
        return WeatherStatus.thunderstorm;
      default:
        return WeatherStatus.cloudy;
    }
  }
}
