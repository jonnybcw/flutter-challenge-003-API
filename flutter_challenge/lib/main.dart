import 'package:flutter/material.dart';
import 'package:flutter_challenge/repositories/weather_repository.dart';
import 'package:flutter_challenge/screens/home_screen/home_screen.dart';

WeatherRepository weatherRepository = WeatherRepository();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
          primaryColor: const Color(0xFF66C5FF), fontFamily: 'Averta'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
