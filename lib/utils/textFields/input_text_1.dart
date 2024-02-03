import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputTextOne extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  bool isPassword;
  bool isNumber;
  InputTextOne(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.isPassword,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E2E2), width: 2),
          borderRadius: BorderRadius.circular(10)),
      height: 50,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: GoogleFonts.mochiyPopOne(
            color: const Color(0xFFC9C9C9),
          ),
          border: InputBorder.none,
        ),
        style: GoogleFonts.mochiyPopOne(color: Colors.black, fontSize: 12),
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
