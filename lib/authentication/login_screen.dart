import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/authentication/sign_up_screen.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/buttons/b2.dart';
import 'package:rideeye/utils/textFields/input_text_1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
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
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Email address'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: true,
                    textEditingController: passwordController,
                    hintText: 'Password'),
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
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                ButtonOne(
                  buttonText: 'Sign In',
                  onTap: () => Get.to(
                    () => const SignUpScreen(),
                    transition: Transition.fade,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonTwo(
                  buttonText: 'Sign In with Google',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member yet? ',
                      style: GoogleFonts.mochiyPopOne(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.mochiyPopOne(
                            fontSize: 12, color: Colors.blue),
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
