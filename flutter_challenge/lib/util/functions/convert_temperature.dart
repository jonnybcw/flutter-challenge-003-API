import 'package:flutter_challenge/models/metric_system.dart';

String convertTemperature(
    {required int temperature, required MetricSystem metricSystem}) {
  if (metricSystem == MetricSystem.metric) {
    return temperature.toString();
  } else {
    double result = ((temperature * 9) / 5) + 32;
    return result.toInt().toString();
  }
}

String convertKilometerToMile(
    {required int value, required MetricSystem metricSystem}) {
  if (metricSystem == MetricSystem.metric) {
    return value.toString();
  } else {
    double result = value / 1.609344;
    return result.toInt().toString();
  }
}

String convertMilimeterToInch(
    {required int value, required MetricSystem metricSystem}) {
  if (metricSystem == MetricSystem.metric) {
    return value.toString();
  } else {
    double result = value / 25.4;
    return result.toInt().toString();
  }
}
