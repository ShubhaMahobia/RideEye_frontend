import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtonOne extends StatelessWidget {
  String buttonText;
  Function onTap;
  ButtonOne({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: Center(
            child: Text(
          buttonText,
          style: GoogleFonts.mochiyPopOne(
            color: Colors.white,
            fontSize: 12,
          ),
        )),
      ),
    );
  }
}
