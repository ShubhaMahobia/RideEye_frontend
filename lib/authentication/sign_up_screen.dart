import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/authentication/login_screen.dart';
import 'package:rideeye/controllers/sign_up_controller.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/buttons/b2.dart';
import 'package:rideeye/utils/textFields/input_text_1.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final SignUpController _signUpController = Get.put(SignUpController());

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
                    textEditingController: _signUpController.fullNameController,
                    hintText: 'Full name*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController: _signUpController.emailController,
                    hintText: 'Email address*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: true,
                    textEditingController: _signUpController.passwordController,
                    hintText: 'Password*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController:
                        _signUpController.enrollmentController,
                    hintText: 'Enrollment Number*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: true,
                    isPassword: false,
                    textEditingController: _signUpController.scholarController,
                    hintText: 'Scholar Number*'),
                const SizedBox(
                  height: 20,
                ),
                ButtonOne(
                  buttonText: 'Next',
                  onTap: () => Get.to(
                    () => const SignUpScreenTwo(),
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
                      onTap: () => Get.to(
                        () => const LoginScreen(),
                        transition: Transition.fade,
                      ),
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

//NEXT PART OF THE SIGN UP SCREEN

class SignUpScreenTwo extends StatefulWidget {
  const SignUpScreenTwo({super.key});

  @override
  State<SignUpScreenTwo> createState() => _SignUpScreenTwoState();
}

String completeAddress = _signUpController.addressOneController.text +
    _signUpController.addressTwoController.text +
    _signUpController.addressThreeController.text;

String busNumber = _signUpController.busNumberController.text.toUpperCase();

class _SignUpScreenTwoState extends State<SignUpScreenTwo> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                Row(
                  children: [
                    Text(
                      'Bus Number',
                      style: GoogleFonts.mochiyPopOne(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 180,
                      child: InputTextOne(
                          isNumber: false,
                          isPassword: false,
                          textEditingController:
                              _signUpController.busNumberController,
                          hintText: 'Optional'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController:
                        _signUpController.addressOneController,
                    hintText: 'Address Line 1*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController:
                        _signUpController.addressTwoController,
                    hintText: 'Address Line 2*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController:
                        _signUpController.addressThreeController,
                    hintText: 'Address Line 3 (Optional)'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: true,
                    isPassword: false,
                    textEditingController: _signUpController.phoneController,
                    hintText: 'Phone Number*'),
                const SizedBox(
                  height: 60,
                ),
                ButtonOne(
                  buttonText: 'Create Account',
                  onTap: () async {
                    EasyLoading.show(status: 'Saving...');
                    _signUpController.signUp(
                      _signUpController.fullNameController.text,
                      _signUpController.emailController.text,
                      _signUpController.passwordController.text,
                      _signUpController.enrollmentController.text,
                      completeAddress,
                      _signUpController.phoneController.text,
                      busNumber,
                      _signUpController.scholarController.text,
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
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
