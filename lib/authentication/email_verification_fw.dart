import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/controllers/login_controller.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerificationPW extends StatefulWidget {
  const EmailVerificationPW({super.key});

  @override
  State<EmailVerificationPW> createState() => _EmailVerificationPWState();
}

String emailAddress = '';
String userOtp = '';
int start = 120;
bool wait = false;

final LoginController _loginController = Get.put(LoginController());

class _EmailVerificationPWState extends State<EmailVerificationPW> {
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

  void resetOTPField() {}

  @override
  void initState() {
    _loginController.otpOneController.clear();
    _loginController.otpTwoController.clear();
    _loginController.otpThreeController.clear();
    _loginController.otpFourController.clear();
    startTimer();
    gettingEmailAddress();
    super.initState();
  }

  @override
  void dispose() {
    resetOTPField();
    _loginController.emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
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
                    height: 60,
                    width: 320,
                    child: Text(
                      'Please verify your mail to reset your password',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
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
                          context, _loginController.emailController.text),
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
                            controller: _loginController.otpOneController,
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
                            controller: _loginController.otpTwoController,
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
                            controller: _loginController.otpThreeController,
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
                            controller: _loginController.otpFourController,
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
                              // _signUpController.resendOTP();
                            }
                          : () {
                              setState(() {
                                userOtp = _loginController
                                        .otpOneController.text +
                                    _loginController.otpTwoController.text +
                                    _loginController.otpThreeController.text +
                                    _loginController.otpFourController.text;
                              });
                              EasyLoading.show(
                                status: 'Verifying....',
                              );
                              _loginController.verifyOTPForResetPW(userOtp);
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
