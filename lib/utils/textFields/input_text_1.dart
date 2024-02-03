import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputTextOne extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  InputTextOne(
      {super.key, required this.textEditingController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: GoogleFonts.mochiyPopOne(
            color: const Color(0xFFC9C9C9),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFE2E2E2),
              width: 2.0,
            ),
          ),
        ),
        style: GoogleFonts.mochiyPopOne(color: Colors.black, fontSize: 12),
        obscureText: true,
      ),
    );
  }
}
