import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ErrorDialog extends StatelessWidget {
  String heading;
  String text;
  ErrorDialog({super.key, required this.heading, required this.text});

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
              'assets/icons/ic_error.png',
              height: 80,
              width: 80,
            ),
            Text(
              heading,
              style: GoogleFonts.mochiyPopOne(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 200,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.mochiyPopOne(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Try Again',
                style: GoogleFonts.mochiyPopOne(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
