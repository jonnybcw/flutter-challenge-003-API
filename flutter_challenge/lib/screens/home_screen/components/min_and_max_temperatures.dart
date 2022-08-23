import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/metric_system.dart';
import 'package:flutter_challenge/models/weather.dart';
import 'package:flutter_challenge/util/functions/convert_temperature.dart';

class MinAndMaxTemperatures extends StatelessWidget {
  const MinAndMaxTemperatures(
      {required this.weather,
      this.spacing = 14.5,
      required this.metricSystem,
      Key? key})
      : super(key: key);

  final Weather weather;
  final double spacing;
  final MetricSystem metricSystem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5),
          child: Icon(
            Icons.arrow_upward_outlined,
            size: 10,
            color: Colors.white,
          ),
        ),
        Text(
          '${convertTemperature(
            temperature: weather.maxTemperature,
            metricSystem: metricSystem,
          )}º',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: spacing,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5),
          child: Icon(
            Icons.arrow_downward_outlined,
            size: 10,
            color: Colors.white,
          ),
        ),
        Text(
          '${convertTemperature(
            temperature: weather.minTemperature,
            metricSystem: metricSystem,
          )}º',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
