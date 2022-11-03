import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/controller/global_controller.dart';
import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MainCard extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const MainCard({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  GlobalController controller = Get.find();
  String date = DateFormat("yMMMd").format(DateTime.now());

  String city = "";

  getAddress(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];

    setState(() {
      city = place.locality!;
    });
  }

  @override
  void initState() {
    getAddress(
      controller.getLattiude().value,
      controller.getLongitude().value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _mainCard(),
        _cityName(),
        _date(),
        _temperature(),
        _image(),
        _description(),
        _windSpeed(),
      ],
    );
  }

  Positioned _windSpeed() {
    return Positioned(
      left: Get.width * 0.08,
      top: Get.height * 0.24,
      child: Text(
        "${widget.weatherDataCurrent.current.windSpeed!.toInt()} m/s",
        style: GoogleFonts.rubik(
          fontSize: 30,
          color: Constants.textColor,
        ),
      ),
    );
  }

  Positioned _description() {
    return Positioned(
      left: 30,
      top: Get.height * 0.34,
      child: Text(
        widget.weatherDataCurrent.current.weather![0].description!
            .toUpperCase(),
        style: GoogleFonts.rubik(
          fontSize: 20,
          color: Constants.textColor,
        ),
      ),
    );
  }

  Positioned _image() {
    return Positioned(
      left: Get.width * 0.5,
      top: 10,
      child: Image.asset(
        "assets/${widget.weatherDataCurrent.current.weather![0].icon}.png",
        height: Get.height * 0.3,
        width: Get.width * 0.4,
      ),
    );
  }

  Positioned _temperature() {
    return Positioned(
      left: 30,
      top: Get.height * 0.15,
      child: Text(
        "${widget.weatherDataCurrent.current.temp!.toInt()} °C",
        style: GoogleFonts.rubik().copyWith(
          fontSize: 50,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Positioned _date() {
    return Positioned(
      left: 30,
      top: Get.height * 0.1,
      child: Text(
        date,
        style: GoogleFonts.rubik().copyWith(
          color: Colors.grey.shade700,
          fontSize: 22,
        ),
      ),
    );
  }

  Positioned _cityName() {
    return Positioned(
      left: 30,
      top: 40,
      child: Text(
        city,
        style: GoogleFonts.rubik().copyWith(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }

  SizedBox _mainCard() {
    return SizedBox(
      height: Get.height * 0.4,
      width: double.infinity,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        color: Constants.primaryColorLight,
      ),
    );
  }
}
