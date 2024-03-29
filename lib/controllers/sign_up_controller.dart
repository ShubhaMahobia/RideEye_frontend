import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rideeye/authentication/email_verification.dart';
import 'package:rideeye/authentication/login_screen.dart';
import 'package:rideeye/utils/dialogBox/error_dialog.dart';
import 'package:rideeye/utils/dialogBox/success_dialogbox.dart';
import 'package:rideeye/utils/validations/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController enrollmentController = TextEditingController();
  final TextEditingController scholarController = TextEditingController();
  final TextEditingController addressOneController = TextEditingController();
  final TextEditingController addressTwoController = TextEditingController();
  final TextEditingController addressThreeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController busNumberController = TextEditingController();
  final TextEditingController otpOneController = TextEditingController();
  final TextEditingController otpTwoController = TextEditingController();
  final TextEditingController otpThreeController = TextEditingController();
  final TextEditingController otpFourController = TextEditingController();
  String otp = '';

  void signUp(
    String fullName,
    String email,
    String password,
    String enrollmentNumber,
    String address,
    String phoneNumber,
    String busNumber,
    String scholarNumber,
  ) async {
    try {
      if (Validation().isValidRegistrationForm(
          fullNameController.text,
          emailController.text,
          passwordController.text,
          enrollmentController.text,
          scholarController.text,
          addressOneController.text,
          addressTwoController.text,
          phoneController.text)) {
        String body = json.encode({
          "fullName": fullName,
          "email": email,
          "password": password,
          "enrollmentNumber": enrollmentNumber,
          "phoneNumber": phoneNumber,
          "address": address,
          "busNumber": busNumber,
          "scholarNumber": scholarNumber,
        });
        http.Response res = await http.post(
          Uri.parse('https://rideeyebackend.azurewebsites.net/api/signUp'),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );

        var jsondata = json.decode(res.body);

        if (jsondata['success'] == true) {
          EasyLoading.dismiss();
          showDialog(
            context: Get.context as BuildContext,
            builder: (context) => SuccessDailog(
              heading: 'Success',
              text: 'Verification Email Sent!!!',
              onTap: () {
                Get.to(() => const EmailVerification());
              },
            ),
          );
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('email');
          prefs.remove('userId');
          prefs.setString('email', email);
          prefs.setString('userId', jsondata['data']['userId']);
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
      } else {
        EasyLoading.dismiss();
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

  void verifyEmail(String otp) async {
    try {
      if (otp.length < 4) {
        EasyLoading.dismiss();
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'Oops',
            text: 'OTP is not valid!',
          ),
        );
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String userId = prefs.getString('userId') as String;
        String body = json.encode({
          "userId": userId,
          "otp": otp,
        });
        http.Response res = await http.post(
          Uri.parse('https://rideeyebackend.azurewebsites.net/api/verifyOTP'),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        var jsondata = json.decode(res.body);
        if (jsondata['success'] == true) {
          EasyLoading.dismiss();
          showDialog(
            context: Get.context as BuildContext,
            builder: (context) => SuccessDailog(
              heading: 'Success',
              text: 'Email Verified Successfully',
              onTap: () {
                Get.to(const LoginScreen());
              },
            ),
          );
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
          text: 'Something went Wrong :(',
        ),
      );
    }
  }

  void resendOTP() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('userId') as String;
      String body = json.encode({
        "userId": userId,
        "email": emailController.text,
      });
      http.Response res = await http.post(
        Uri.parse('https://rideeyebackend.azurewebsites.net/api/resendOTP'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      var jsondata = json.decode(res.body);

      if (jsondata['success'] == true) {
        EasyLoading.dismiss();
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => SuccessDailog(
            onTap: () {},
            heading: 'Sent!',
            text: 'OTP sent Successfully!!',
          ),
        );
      } else {
        EasyLoading.dismiss();
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'OOPS',
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
          text: 'Something went Wrong :(',
        ),
      );
    }
  }
}
