import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:flutter_weather_app/model/weather_data_daily.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataDaily getDailyWeather() => daily!;
}
