import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/controller/global_controller.dart';

import 'package:flutter_weather_app/widgets/forecat_for_next_days_widget.dart';
import 'package:flutter_weather_app/widgets/main_card_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textTitle = "Weather Forecast";

  final GlobalController controller = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColorDark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          _textTitle,
          style: GoogleFonts.rubik().copyWith(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Obx(
          () => controller.checkLoading().isTrue
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    MainCard(
                      weatherDataCurrent:
                          controller.getData().getCurrentWeather(),
                    ),
                    _constText(),
                    SizedBox(height: Get.height * 0.03),
                    Expanded(
                      child: ForecastNextDays(
                        weatherDataDaily:
                            controller.getData().getDailyWeather(),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Padding _constText() {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: Get.height * 0.05),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Forecast for next days",
          style: GoogleFonts.rubik().copyWith(
            color: const Color(0xffA98A3B),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
