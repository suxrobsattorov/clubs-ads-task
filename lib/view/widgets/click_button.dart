import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ClickButton extends StatelessWidget {
  String name;

  ClickButton({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(
          begin: Alignment(0, -1),
          end: Alignment(0, 1),
          colors: <Color>[
            Color(0xad01001f),
            Color(0xff01001f),
          ],
          stops: <double>[0, 1],
        ),
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.mulish(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
