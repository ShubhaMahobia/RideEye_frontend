import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rideeye/authentication/email_verification_fw.dart';
import 'package:rideeye/authentication/login_screen.dart';
import 'package:rideeye/authentication/reset_password.dart';
import 'package:rideeye/userProfile/user_profile.dart';
import 'package:rideeye/utils/dialogBox/error_dialog.dart';
import 'package:rideeye/utils/validations/validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpOneController = TextEditingController();
  final TextEditingController otpTwoController = TextEditingController();
  final TextEditingController otpThreeController = TextEditingController();
  final TextEditingController otpFourController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var user = {}.obs;
  RxBool fromEditProfile = false.obs;

  void userLogin() async {
    if (Validation()
        .isValidLogin(emailController.text, passwordController.text)) {
      try {
        String body = json.encode({
          "email": emailController.text,
          "password": passwordController.text
        });
        EasyLoading.show(status: 'Hang on...');
        http.Response res = await http.post(
          Uri.parse('https://rideeyebackend.azurewebsites.net/api/login'),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );

        var jsondata = json.decode(res.body);

        if (jsondata['success'] == true) {
          EasyLoading.dismiss();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var myToken = jsondata['token'];
          prefs.setString('token', myToken);

          Get.to(() => const UserProfile(),
              transition: Transition.noTransition);
        } else {
          EasyLoading.dismiss();
          showDialog(
            context: Get.context as BuildContext,
            builder: (context) => ErrorDialog(
              heading: 'Oops',
              text: 'Email/Password is wrong, Please try again!',
            ),
          );
        }
      } on Exception catch (e) {
        EasyLoading.dismiss();
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'Oops',
            text: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> sendVerifcationMailForgotPassword(String email) async {
    try {
      EasyLoading.show(status: 'Hang on...');
      if (emailController.text.isEmpty) {
        EasyLoading.dismiss();
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'Oops',
            text: 'Email Field Cannot be empty',
          ),
        );
      } else {
        String body = json.encode({
          "email": email,
        });
        http.Response res = await http.post(
          Uri.parse(
              'https://rideeyebackend.azurewebsites.net/api/forgotpassreq'),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        var jsondata = json.decode(res.body);

        if (jsondata['success'] == true) {
          EasyLoading.dismiss();
          Get.to(() => const EmailVerificationPW(),
              transition: Transition.noTransition);
        } else {
          EasyLoading.dismiss();
          showDialog(
            context: Get.context as BuildContext,
            builder: (context) => ErrorDialog(
              heading: 'Oops',
              text: jsondata['message'],
            ),
          );
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Something Went Wrong!!',
        ),
      );
    }
  }

  Future<void> verifyOTPForResetPW(String otp) async {
    try {
      EasyLoading.show(status: 'Verifying...');
      String body = json.encode({
        "email": emailController.text,
        "otp": otp,
      });

      http.Response res = await http.post(
        Uri.parse(
            'https://rideeyebackend.azurewebsites.net/api/forgotpassverify'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      var jsondata = json.decode(res.body);

      if (jsondata['success'] == true) {
        EasyLoading.dismiss();
        Get.to(() => const ResetPasswordScreen(),
            transition: Transition.noTransition);
      } else {
        EasyLoading.dismiss();
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'Oops',
            text: jsondata['message'],
          ),
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Something Went Wrong',
        ),
      );
    }
  }

  Future<void> resetPassword() async {
    try {
      if (resetPasswordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'Oops',
            text: 'Fields cannot be empty',
          ),
        );
        if (resetPasswordController.text != confirmPasswordController.text) {
          showDialog(
            context: Get.context as BuildContext,
            builder: (context) => ErrorDialog(
              heading: 'Oops',
              text: 'Password should be same',
            ),
          );
          if (confirmPasswordController.text.length < 8) {
            showDialog(
              context: Get.context as BuildContext,
              builder: (context) => ErrorDialog(
                heading: 'Oops',
                text: 'Password should be 8 character long',
              ),
            );
          }
        }
      } else {
        EasyLoading.show(status: 'Resetting...');
        String body = json.encode({
          "email": emailController.text,
          "newPassword": confirmPasswordController.text,
        });

        http.Response res = await http.post(
          Uri.parse('https://rideeyebackend.azurewebsites.net/api/updatepass'),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        var jsondata = json.decode(res.body);

        if (jsondata['success'] == true) {
          EasyLoading.dismiss();
          Get.to(
              () => fromEditProfile.value
                  ? const UserProfile()
                  : const LoginScreen(),
              transition: Transition.noTransition);
        } else {
          EasyLoading.dismiss();
          showDialog(
            context: Get.context as BuildContext,
            builder: (context) => ErrorDialog(
              heading: 'Oops',
              text: jsondata['message'],
            ),
          );
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: e.toString(),
        ),
      );
    }
  }
}
