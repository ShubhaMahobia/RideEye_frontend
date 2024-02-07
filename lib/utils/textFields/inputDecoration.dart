// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInputField {
  static BoxDecoration formTextFieldContainer(BuildContext context) {
    return BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E2E2), width: 2),
        borderRadius: BorderRadius.circular(10));
  }

  static InputDecoration formTextField(BuildContext context, String hintext) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      hintText: hintext,
      hintStyle: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: const Color.fromARGB(255, 189, 189, 189),
      ),
      border: InputBorder.none,
    );
  }
}
