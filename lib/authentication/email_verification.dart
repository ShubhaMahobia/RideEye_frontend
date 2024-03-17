import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rideeye/controllers/sign_up_controller.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

String emailAddress = '';
String userOtp = '';
int start = 120;
bool wait = false;

final SignUpController _signUpController = Get.put(SignUpController());

class _EmailVerificationState extends State<EmailVerification> {
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void gettingEmailAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailAddress = prefs.getString('email') as String;
  }

  void resetOTPField() {
    _signUpController.otpOneController.clear();
    _signUpController.otpTwoController.clear();
    _signUpController.otpThreeController.clear();
    _signUpController.otpFourController.clear();
  }

  @override
  void initState() {
    startTimer();
    gettingEmailAddress();
    super.initState();
  }

  @override
  void dispose() {
    resetOTPField();
    _signUpController.emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                    height: MediaQuery.of(context).size.height * 0.1875,
                    width: MediaQuery.of(context).size.width * 0.833,
                  ),
                  SizedBox(
                    height: 40,
                    width: 240,
                    child: Text(
                      'Email Verifcation',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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
                      readOnly: true,
                      textAlign: TextAlign.center,
                      decoration: FormInputField.formTextField(
                          context, _signUpController.emailController.text),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 68,
                        width: 68,
                        decoration:
                            FormInputField.formTextFieldContainer(context),
                        child: Center(
                          child: TextField(
                            controller: _signUpController.otpOneController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 68,
                        width: 68,
                        decoration:
                            FormInputField.formTextFieldContainer(context),
                        child: Center(
                          child: TextField(
                            controller: _signUpController.otpTwoController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 68,
                        width: 68,
                        decoration:
                            FormInputField.formTextFieldContainer(context),
                        child: Center(
                          child: TextField(
                            controller: _signUpController.otpThreeController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 68,
                        width: 68,
                        decoration:
                            FormInputField.formTextFieldContainer(context),
                        child: Center(
                          child: TextField(
                            controller: _signUpController.otpFourController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resend OTP After $start seconds ',
                          style: GoogleFonts.plusJakartaSans(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  ButtonOne(
                      buttonText: wait ? 'Resend OTP' : 'Verify',
                      onTap: wait
                          ? () {
                              EasyLoading.show(
                                status: 'Resending OTP....',
                              );
                              startTimer();
                              setState(() {
                                start = 120;
                                wait = false;
                              });
                              resetOTPField();
                              _signUpController.resendOTP();
                            }
                          : () {
                              setState(() {
                                userOtp = _signUpController
                                        .otpOneController.text +
                                    _signUpController.otpTwoController.text +
                                    _signUpController.otpThreeController.text +
                                    _signUpController.otpFourController.text;
                              });
                              EasyLoading.show(
                                status: 'Verifying....',
                              );
                              _signUpController.verifyEmail(userOtp);
                            }),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 50,
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
