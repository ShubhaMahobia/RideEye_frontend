import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/controllers/login_controller.dart';

import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

final LoginController _loginController = Get.put(LoginController());

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  void dispose() {
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
                    'Reset Your Password',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  'assets/icons/security.png',
                  height: MediaQuery.of(context).size.height * 0.1175,
                  width: MediaQuery.of(context).size.width * 0.533,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: FormInputField.formTextFieldContainer(context),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _loginController.resetPasswordController,
                    textAlign: TextAlign.center,
                    decoration: FormInputField.formTextField(
                        context, 'Enter New Password*'),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: FormInputField.formTextFieldContainer(context),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _loginController.confirmPasswordController,
                    textAlign: TextAlign.center,
                    decoration: FormInputField.formTextField(
                        context, 'Confirm your Password*'),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                ButtonOne(
                    buttonText: 'Reset & Login',
                    onTap: () {
                      _loginController.resetPassword();
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
