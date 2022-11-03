import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/model/weather_data_daily.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ForecastNextDays extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const ForecastNextDays({Key? key, required this.weatherDataDaily})
      : super(key: key);

  String getDate(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final date = DateFormat("EEEE").format(time);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount:
          weatherDataDaily.daily.length > 7 ? 7 : weatherDataDaily.daily.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            SizedBox(
              height: 300,
              width: Get.width * 0.7,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                color: Constants.primaryColorLight,
              ),
            ),
            _temperature(
              weatherDataDaily.daily[index].temp!.max!.toInt(),
            ),
            _daysofWeek(
              getDate(weatherDataDaily.daily[index].dt),
            ),
            _weatherIcons(
              weatherDataDaily.daily[index].weather![0].icon.toString(),
            ),
            _windSpeed(
              weatherDataDaily.daily[index].windSpeed!.toInt(),
            ),
            _humidity(
              weatherDataDaily.daily[index].humidity!.toInt(),
            ),
            _weatherDescription(
              weatherDataDaily.daily[index].weather![0].main ?? "",
            ),
          ],
        );
      },
    );
  }
}

Positioned _windSpeed(int speed) {
  return Positioned(
    top: Get.height * 0.23,
    left: 20,
    child: Wrap(
      spacing: 20,
      children: [
        Text(
          "Wind speed :",
          style: Constants.textStyle,
        ),
        Text(
          "$speed m/s",
          style: Constants.textStyle,
        )
      ],
    ),
  );
}

Positioned _weatherIcons(String path) {
  return Positioned(
    top: 15,
    left: Get.width * 0.34,
    child: Image.asset(
      "assets/$path.png",
      height: Get.height * 0.15,
      width: Get.width * 0.31,
    ),
  );
}

Positioned _daysofWeek(String day) {
  return Positioned(
    top: 30,
    left: 20,
    child: Text(
      day,
      style: Constants.textStyle,
    ),
  );
}

Positioned _temperature(int temperature) {
  return Positioned(
    left: 20,
    top: 80,
    child: Text(
      "$temperature °C",
      style: Constants.temperatureTextStyle,
    ),
  );
}

Positioned _humidity(int humidity) {
  return Positioned(
    top: Get.height * 0.28,
    left: 20,
    child: Wrap(
      spacing: 20,
      children: [
        Text(
          "Humidity :",
          style: Constants.textStyle,
        ),
        Text(
          "$humidity %",
          style: Constants.textStyle,
        )
      ],
    ),
  );
}

Positioned _weatherDescription(String description) {
  return Positioned(
    top: Get.height * 0.16,
    left: 20,
    child: Text(
      description.toUpperCase(),
      style: Constants.descriptionTextStyle,
    ),
  );
}
