import 'dart:convert';

import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:flutter_weather_app/model/weather_data_daily.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app/api/api_key.dart';
import 'package:flutter_weather_app/model/weather_data.dart';

class FeatchWeatherApi {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    final responce = await http.get(Uri.parse(apiUrl(lat, lon)));
    final jsonString = jsonDecode(responce.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );
    return weatherData!;
  }
}

String apiUrl(lat, lon) {
  String path;
  path =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely,hourly,alerts";
  return path;
}
