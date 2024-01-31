import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {

  static Text titleText(String text) {
    return Text(
      text,
      style: GoogleFonts.mulish(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.2000000477,
        color: const Color(0xff232638),
      ),
    );
  }

  static Text labelStyle(String text) {
    return Text(
      text,
      style: GoogleFonts.mulish(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.2000000477,
        color: const Color(0xff232638),
      ),
    );
  }

  static TextStyle hintStyle() {
    return GoogleFonts.mulish(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5714285714,
      color: const Color(0xff949ca9),
    );
  }

}
