import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/buttons/b2.dart';
import 'package:rideeye/utils/textFields/input_text_1.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
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
                  height: MediaQuery.of(context).size.height * 0.1175,
                  width: MediaQuery.of(context).size.width * 0.533,
                ),
                SizedBox(
                  height: 40,
                  width: 280,
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.mochiyPopOne(
                      fontSize: 28,
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
                    hintText: 'Full name*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Email address*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: true,
                    textEditingController: emailController,
                    hintText: 'Password*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Enrollment Number*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: true,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Scholar Number*'),
                const SizedBox(
                  height: 20,
                ),
                ButtonOne(
                  buttonText: 'Next',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonTwo(
                  buttonText: 'Sign In with Google',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Member? ',
                      style: GoogleFonts.mochiyPopOne(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Log in',
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
