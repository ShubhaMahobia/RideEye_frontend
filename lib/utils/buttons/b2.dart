import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtonTwo extends StatelessWidget {
  String buttonText;
  Function onTap;
  ButtonTwo({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue, width: 2.0),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Center(
            child: Text(
          buttonText,
          style: GoogleFonts.plusJakartaSans(
              color: Colors.lightBlue,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
