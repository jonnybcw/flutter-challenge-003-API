import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/metric_system.dart';
import 'package:flutter_challenge/models/weather.dart';
import 'package:flutter_challenge/models/weather_status.dart';

import 'home_screen/components/weather_info.dart';

class WeekdayScreen extends StatelessWidget {
  const WeekdayScreen(
      {required this.weather, required this.metricSystem, Key? key})
      : super(key: key);

  final Weather weather;
  final MetricSystem metricSystem;

  List<Color> getBackgroundColor() {
    switch (weather.currentWeatherStatus) {
      case (WeatherStatus.sunny):
        return [const Color(0xFF66C5FF), const Color(0xFF1580FD)];
      case (WeatherStatus.partlyCloudy):
        return [const Color(0xFF66C5FF), const Color(0xFF1580FD)];
      case (WeatherStatus.mostlyCloudy):
        return [const Color(0xFF66C5FF), const Color(0xFF1580FD)];
      case (WeatherStatus.cloudy):
        return [const Color(0xFF68B4EF), const Color(0xFF325AC2)];
      case (WeatherStatus.showers):
        return [const Color(0xFF68B4EF), const Color(0xFF325AC2)];
      case (WeatherStatus.rain):
        return [const Color(0xFF68B4EF), const Color(0xFF325AC2)];
      case (WeatherStatus.thunderstorm):
        return [const Color(0xFF6086DC), const Color(0xFF273369)];
      default:
        return [const Color(0xFF66C5FF), const Color(0xFF1580FD)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: getBackgroundColor(),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.25),
          backgroundColor: Color.lerp(
              getBackgroundColor()[0], getBackgroundColor()[1], 0.35),
          title: Text(weather.title),
          centerTitle: true,
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: WeatherInfo(
              weather: weather,
              metricSystem: metricSystem,
            ),
          )
        ]),
      ),
    );
  }
}
