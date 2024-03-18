import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/controllers/login_controller.dart';

import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

final LoginController _loginController = Get.put(LoginController());

class _UpdatePasswordState extends State<UpdatePassword> {

  @override
  void initState() {
    _loginController.emailController.clear();
    super.initState();
  }
  @override
  void dispose() {
    _loginController.emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    height: MediaQuery.of(context).size.height * 0.1175,
                    width: MediaQuery.of(context).size.width * 0.533,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: 320,
                    child: Text(
                      'Want to Change Your Password?',
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
                      decoration: FormInputField.formTextField(
                          context, 'Email address*'),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
