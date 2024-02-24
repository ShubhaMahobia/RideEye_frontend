import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/authentication/login_screen.dart';
import 'package:rideeye/controllers/login_controller.dart';

import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';

class ForgotPasswordEmailVerification extends StatefulWidget {
  const ForgotPasswordEmailVerification({super.key});

  @override
  State<ForgotPasswordEmailVerification> createState() =>
      _ForgotPasswordEmailVerificationState();
}

final LoginController _loginController = Get.put(LoginController());

class _ForgotPasswordEmailVerificationState
    extends State<ForgotPasswordEmailVerification> {
  @override
  void dispose() {
    _loginController.emailController.clear();
    super.dispose();
  }

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
                  width: 320,
                  child: Text(
                    'Forgot Your Password?',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: Text(
                    'Enter your registered email address to reset your password',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: FormInputField.formTextFieldContainer(context),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _loginController.emailController,
                    textAlign: TextAlign.center,
                    decoration:
                        FormInputField.formTextField(context, 'Email address*'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                ButtonOne(
                    buttonText: 'Send OTP',
                    onTap: () {
                      _loginController.sendVerifcationMailForgotPassword(
                          _loginController.emailController.text);
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Member? ',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginScreen(),
                            transition: Transition.noTransition);
                      },
                      child: Text(
                        'Log in',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
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
