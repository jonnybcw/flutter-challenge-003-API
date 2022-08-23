import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/metric_system.dart';
import 'package:flutter_challenge/models/weather.dart';
import 'package:flutter_challenge/models/weather_status.dart';
import 'package:flutter_challenge/screens/weekday_screen.dart';

import 'min_and_max_temperatures.dart';

class WeatherListTile extends StatelessWidget {
  const WeatherListTile(
      {required this.weather, required this.metricSystem, Key? key})
      : super(key: key);

  final Weather weather;
  final MetricSystem metricSystem;

  String getWeatherImage() {
    switch (weather.currentWeatherStatus) {
      case (WeatherStatus.sunny):
        return 'assets/images/sunny.png';
      case (WeatherStatus.partlyCloudy):
        return 'assets/images/partlycloudy.png';
      case (WeatherStatus.mostlyCloudy):
        return 'assets/images/mostlycloudy.png';
      case (WeatherStatus.cloudy):
        return 'assets/images/cloudy.png';
      case (WeatherStatus.showers):
        return 'assets/images/showers.png';
      case (WeatherStatus.rain):
        return 'assets/images/rain.png';
      case (WeatherStatus.thunderstorm):
        return 'assets/images/thunderstorm.png';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WeekdayScreen(
                  weather: weather,
                  metricSystem: metricSystem,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 30,
              child: Text(
                weather.title.substring(0, 3),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.72),
                ),
              ),
            ),
            const SizedBox(
              width: 28.5,
            ),
            Image.asset(
              getWeatherImage(),
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                weather.forecast,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.72),
                ),
              ),
            ),
            MinAndMaxTemperatures(
              weather: weather,
              spacing: 10.5,
              metricSystem: metricSystem,
            ),
          ],
        ),
      ),
    );
  }
}
