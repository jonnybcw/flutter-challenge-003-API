import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/models/forecast_week.dart';
import 'package:flutter_challenge/models/metric_system.dart';
import 'package:flutter_challenge/models/weather.dart';
import 'package:flutter_challenge/models/weather_status.dart';
import 'package:flutter_challenge/screens/home_screen/components/weather_list_tile.dart';
import 'package:flutter_challenge/screens/home_screen/components/weather_info.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Weather> weekWeather;
  Weather? today;

  @override
  void initState() {
    super.initState();
  }

  TextTheme? textTheme;
  MetricSystem _selectedMetricSystem = MetricSystem.metric;

  Future<Weather> loadJsonWeather() async {
    final String response =
        await rootBundle.loadString('assets/data/weather-data.json');
    final data = await jsonDecode(response);
    today = Weather.fromJson(data['today']);

    weekWeather = [];
    for (Map<String, dynamic> day in data['week-forecast']) {
      Weather weatherDay = Weather.fromJson(day);
      weekWeather.add(weatherDay);
    }

    return today!;
  }

  List<Color> getBackgroundColor() {
    if (today == null) {
      return [const Color(0xFF66C5FF), const Color(0xFF1580FD)];
    }
    switch (today?.currentWeatherStatus) {
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
    textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: getBackgroundColor(),
      )),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.25),
              backgroundColor: Color.lerp(
                  getBackgroundColor()[0], getBackgroundColor()[1], 0.35),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              centerTitle: true,
              title: Image.asset(
                'assets/icons/logo_small.png',
                height: 15,
              ),
              actions: [
                PopupMenuButton<MetricSystem>(
                  padding: const EdgeInsets.only(right: 4.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  icon: Image.asset(
                    'assets/icons/ic_settings.png',
                    width: 18,
                    height: 18,
                  ),
                  onSelected: (MetricSystem result) {
                    setState(() {
                      _selectedMetricSystem = result;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<MetricSystem>>[
                    PopupMenuItem<MetricSystem>(
                      value: MetricSystem.metric,
                      child: Row(
                        children: [
                          Radio(
                            visualDensity: VisualDensity.compact,
                            fillColor: MaterialStateProperty.all(
                                _getRadioColor(MetricSystem.metric)),
                            value: MetricSystem.metric,
                            groupValue: _selectedMetricSystem,
                            onChanged: (_) {
                              setState(() {
                                _selectedMetricSystem = MetricSystem.metric;
                                Navigator.pop(context);
                              });
                            },
                          ),
                          Text(
                            'Metric',
                            style: TextStyle(
                                color:
                                    _selectedMetricSystem == MetricSystem.metric
                                        ? const Color(0xFF3593FF)
                                        : const Color(0xFF646570),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<MetricSystem>(
                      value: MetricSystem.imperial,
                      child: Row(
                        children: [
                          Radio(
                            visualDensity: VisualDensity.compact,
                            fillColor: MaterialStateProperty.all(
                                _getRadioColor(MetricSystem.imperial)),
                            value: MetricSystem.imperial,
                            groupValue: _selectedMetricSystem,
                            onChanged: (_) {
                              setState(() {
                                _selectedMetricSystem = MetricSystem.imperial;
                                Navigator.pop(context);
                              });
                            },
                          ),
                          Text(
                            'Imperial',
                            style: TextStyle(
                                color: _selectedMetricSystem ==
                                        MetricSystem.imperial
                                    ? const Color(0xFF3593FF)
                                    : const Color(0xFF646570),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      'Today',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      'Week',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            body: _getBody(context)),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return TabBarView(children: [
      FutureBuilder<Weather?>(
          future: weatherRepository.fetchTodayForecast(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: WeatherInfo(
                    weather: snapshot.data!,
                    metricSystem: _selectedMetricSystem,
                  ),
                )
              ]);
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          }),
      FutureBuilder<ForecastWeek?>(
          future: weatherRepository.fetchForecastWeek(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: ListView.builder(
                        itemBuilder: (context, index) {
                          return WeatherListTile(
                            weather: snapshot.data!.days[index],
                            metricSystem: _selectedMetricSystem,
                          );
                        },
                        itemCount: snapshot.data!.days.length,
                      )),
                    ],
                  ),
                ),
              ]);
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          }),
    ]);
  }

  Color? _getRadioColor(MetricSystem option) {
    if (_selectedMetricSystem == option) {
      return const Color(0xFF3593FF);
    } else {
      return const Color(0xFF646570);
    }
  }
}
