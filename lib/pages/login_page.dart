// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    _checkInternet();
  }

  _checkInternet() async {
    bool hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection == false) {
      showSimpleNotification(
        duration: const Duration(seconds: 4),
        const Text(
          "Please check internet",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        background: Colors.red,
      );
    } else {
      await Future.delayed(const Duration(seconds: 4));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const imagePath = "assets/login_image.json";
    return Scaffold(
      backgroundColor: Constants.primaryColorDark,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: Get.height * 0.14,
            ),
            child: Lottie.asset(
              fit: BoxFit.fill,
              imagePath,
            ),
          ),
          Text(
            "Welcome",
            style: GoogleFonts.rubik().copyWith(
              fontSize: 55,
              color: Constants.textColor,
            ),
          )
        ],
      ),
    );
  }
}
