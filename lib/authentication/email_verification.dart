import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/authentication/sign_up_screen.dart';
import 'package:rideeye/controllers/sign_up_controller.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/buttons/b2.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

String emailAddress = '';
final SignUpController _signUpController = Get.put(SignUpController());

class _EmailVerificationState extends State<EmailVerification> {
  void gettingEmailAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailAddress = prefs.getString('email') as String;
  }

  @override
  void initState() {
    gettingEmailAddress();
    super.initState();
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
                      decoration:
                          FormInputField.formTextField(context, emailAddress),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  ButtonOne(
                    buttonText: 'Verify',
                    onTap: () => Get.to(
                      () => const SignUpScreen(),
                      transition: Transition.fade,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonTwo(
                    buttonText: 'Resend OTP',
                    onTap: () {},
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
