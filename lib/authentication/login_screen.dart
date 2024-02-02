import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/icons/ride_logo_trsprnt.png',
                  height: MediaQuery.of(context).size.height * 0.1875,
                  width: MediaQuery.of(context).size.width * 0.833,
                ),
                SizedBox(
                  height: 40,
                  width: 240,
                  child: Text(
                    'Never miss a bus, find your bus routes in the area',
                    style: GoogleFonts.mochiyPopOne(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Email address',
                      hintStyle: GoogleFonts.mochiyPopOne(
                        color: const Color(0xFFC9C9C9),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFE2E2E2),
                          width: 4,
                        ),
                      ),
                    ),
                    style: GoogleFonts.mochiyPopOne(
                        color: Colors.black, fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Password',
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
                    style: GoogleFonts.mochiyPopOne(
                        color: Colors.black, fontSize: 12),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.mochiyPopOne(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Center(
                        child: Text(
                      'Sign In',
                      style: GoogleFonts.mochiyPopOne(color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      'Sign In with Google',
                      style: GoogleFonts.mochiyPopOne(color: Colors.black),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member yet?',
                      style: GoogleFonts.mochiyPopOne(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        ' Sign up',
                        style: GoogleFonts.mochiyPopOne(
                            fontSize: 14, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
