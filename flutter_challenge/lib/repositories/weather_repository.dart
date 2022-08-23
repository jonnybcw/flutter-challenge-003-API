import 'dart:convert';
import 'dart:developer';

import 'package:flutter_challenge/models/forecast_week.dart';
import 'package:flutter_challenge/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final _client = http.Client();

  Future<ForecastWeek?> fetchForecastWeek() async {
    try {
      http.Response response =
          await _client.get(Uri.parse('http://localhost:3000/week_forecast'));
      if (response.statusCode == 200) {
        log('RESPONSE fetchForecastWeek(): ${response.body}');
        ForecastWeek data = ForecastWeek.fromJson(jsonDecode(response.body));
        return data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Weather?> fetchTodayForecast() async {
    try {
      http.Response response =
          await _client.get(Uri.parse('http://localhost:3000/today'));
      if (response.statusCode == 200) {
        log('RESPONSE fetchTodayForecast(): ${response.body}');
        Weather data = Weather.fromJson(jsonDecode(response.body));
        return data;
      }
    } catch (e) {
      print(e);
    }
  }
}
