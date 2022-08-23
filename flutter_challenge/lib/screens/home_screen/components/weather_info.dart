import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/metric_system.dart';
import 'package:flutter_challenge/models/weather.dart';
import 'package:flutter_challenge/models/weather_status.dart';
import 'package:flutter_challenge/util/functions/convert_temperature.dart';

import 'min_and_max_temperatures.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo(
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 24,
        ),
        Image.asset(
          getWeatherImage(),
          width: 160,
          height: 160,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          weather.forecast,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 12,
        ),
        if (weather.currentTemperature != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                convertTemperature(
                  temperature: weather.currentTemperature!,
                  metricSystem: metricSystem,
                ),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 4),
                child: Text(
                  metricSystem == MetricSystem.metric ? 'ºC' : 'ºF',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        if (weather.currentTemperature != null)
          const SizedBox(
            height: 12,
          ),
        MinAndMaxTemperatures(
          weather: weather,
          metricSystem: metricSystem,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    'assets/icons/ic_humidity.png',
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${weather.humidity}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    'assets/icons/ic_wind.png',
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  convertKilometerToMile(
                          value: weather.windSpeed,
                          metricSystem: metricSystem) +
                      (metricSystem == MetricSystem.metric ? ' km/h' : ' mph'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    'assets/icons/ic_precipitation.png',
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  convertMilimeterToInch(
                          value: weather.precipitation,
                          metricSystem: metricSystem) +
                      (metricSystem == MetricSystem.metric ? ' mm' : ' inch'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
