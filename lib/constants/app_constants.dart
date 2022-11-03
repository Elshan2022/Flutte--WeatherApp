import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static Color primaryColorLight = const Color(0xff272961);
  static Color primaryColorDark = const Color(0xff101039);
  static Icon searchIcon = const Icon(Icons.search, size: 30);
  static TextStyle textStyle = GoogleFonts.rubik().copyWith(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: const Color(0xffA98A3B),
  );
  static TextStyle temperatureTextStyle = GoogleFonts.rubik().copyWith(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static TextStyle descriptionTextStyle = GoogleFonts.rubik().copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 25,
    color: const Color(0xffA98A3B).withOpacity(0.8),
  );

  static Color textColor = const Color(0xffA98A3B);
}
