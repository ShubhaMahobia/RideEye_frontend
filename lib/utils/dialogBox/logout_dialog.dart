import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LogoutDialog extends StatelessWidget {
  VoidCallback onTap;
  LogoutDialog({super.key, required this.onTap});

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
              'Are you sure you want to logout?',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: onTap,
              child: Text(
                'Yes',
                style: GoogleFonts.plusJakartaSans(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
