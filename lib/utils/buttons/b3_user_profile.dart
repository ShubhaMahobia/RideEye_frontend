import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserProfileButton extends StatelessWidget {
  String iconPath;
  String buttonText;
  VoidCallback onTap;

  UserProfileButton(
      {super.key,
      required this.buttonText,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFFC3C3C3))),
          height: 60,
          child: ListTile(
            leading: Image.asset(
              iconPath,
              height: 30,
              width: 30,
            ),
            title: Text(
              buttonText,
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
