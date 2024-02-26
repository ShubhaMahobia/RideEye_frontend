import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/authentication/login_screen.dart';
import 'package:rideeye/controllers/sign_up_controller.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/buttons/b2.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final SignUpController _signUpController = Get.put(SignUpController());

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    _signUpController.fullNameController.clear();
    _signUpController.passwordController.clear();
    _signUpController.enrollmentController.clear();
    _signUpController.scholarController.clear();
    _signUpController.busNumberController.clear();
    _signUpController.addressOneController.clear();
    _signUpController.addressTwoController.clear();
    _signUpController.addressThreeController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
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
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _signUpController.fullNameController,
                      decoration:
                          FormInputField.formTextField(context, 'Full name*'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _signUpController.emailController,
                      decoration: FormInputField.formTextField(
                          context, 'Email address*'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      obscureText: true,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _signUpController.passwordController,
                      decoration:
                          FormInputField.formTextField(context, 'Password*'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _signUpController.enrollmentController,
                      decoration: FormInputField.formTextField(
                          context, 'Enrollment Number*'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      keyboardType: TextInputType.phone,
                      controller: _signUpController.scholarController,
                      decoration: FormInputField.formTextField(
                          context, 'Scholar Number*'),
                    ),
                  ),
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
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(
                          () => const LoginScreen(),
                          transition: Transition.fade,
                        ),
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
  void dispose() {
    _signUpController.fullNameController;
    _signUpController.emailController;
    _signUpController.passwordController;
    _signUpController.enrollmentController;
    _signUpController.scholarController;
    _signUpController.addressOneController;
    _signUpController.addressTwoController;
    _signUpController.addressThreeController;
    _signUpController.phoneController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
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
                      style: GoogleFonts.plusJakartaSans(
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
                      Container(
                        decoration:
                            FormInputField.formTextFieldContainer(context),
                        width: 180,
                        child: TextField(
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          controller: _signUpController.busNumberController,
                          decoration:
                              FormInputField.formTextField(context, 'Optional'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _signUpController.addressOneController,
                      decoration: FormInputField.formTextField(
                          context, 'Address Line 1*'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _signUpController.addressTwoController,
                      decoration: FormInputField.formTextField(
                          context, 'Address Line 2*'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _signUpController.addressThreeController,
                      decoration: FormInputField.formTextField(
                          context, 'Address Line 3 (Optional)*'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: FormInputField.formTextFieldContainer(context),
                    child: TextField(
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _signUpController.phoneController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: FormInputField.formTextField(
                          context, 'Phone Number*'),
                    ),
                  ),
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
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {},
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
      ),
    );
  }
}
