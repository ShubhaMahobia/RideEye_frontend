import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/authentication/forgot_pw_email_verification.dart';
import 'package:rideeye/authentication/sign_up_screen.dart';
import 'package:rideeye/controllers/login_controller.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/buttons/b2.dart';
import 'package:rideeye/utils/textFields/inputDecoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final LoginController _loginController = Get.put(LoginController());

class _LoginScreenState extends State<LoginScreen> {
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
                    height: MediaQuery.of(context).size.height * 0.1675,
                    width: MediaQuery.of(context).size.width * 0.833,
                  ),
                  SizedBox(
                    height: 50,
                    width: 240,
                    child: Text(
                      'Never miss a bus, find your bus routes in the area',
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
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      controller: _loginController.emailController,
                      decoration: FormInputField.formTextField(
                          context, 'Email Address'),
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
                      obscureText: true,
                      controller: _loginController.passwordController,
                      decoration:
                          FormInputField.formTextField(context, 'Password'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _loginController.fromEditProfile.value = false;
                            Get.to(
                                () => const ForgotPasswordEmailVerification(),
                                transition: Transition.noTransition);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14, fontWeight: FontWeight.bold),
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
                      onTap: () {
                        EasyLoading.show(status: 'Hang on...');
                        _loginController.userLogin();
                      }),
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
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignUpScreen(),
                              transition: Transition.noTransition);
                        },
                        child: Text(
                          'Sign up',
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
