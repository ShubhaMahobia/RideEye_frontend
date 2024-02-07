import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/authentication/login_screen.dart';

// ignore: must_be_immutable
class SuccessDailog extends StatelessWidget {
  String heading;
  String text;
  VoidCallback onTap;
  SuccessDailog(
      {super.key,
      required this.heading,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/ic_success.png',
              height: 80,
              width: 80,
            ),
            Text(
              heading,
              style: GoogleFonts.mochiyPopOne(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              text,
              style: GoogleFonts.mochiyPopOne(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
            ElevatedButton(
              onPressed: () {
                onTap();
              },
              child: Text(
                'Continue',
                style: GoogleFonts.mochiyPopOne(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
