import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rideeye/utils/dialogBox/error_dialog.dart';
import 'package:rideeye/utils/dialogBox/success_dialogbox.dart';

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

  signUp(
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
      String body = json.encode({
        "fullName": fullName,
        "email": email,
        "password": password,
        "enrollmentNumber": enrollmentNumber,
        "phoneNumber": "9479798601",
        "address": address,
        "busNumber": "dummy Bus Number",
        "scholarNumber": scholarNumber,
      });
      http.Response res = await http.post(
        Uri.parse('https://rideeyebackend.azurewebsites.net/api/signUp'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      var jsondata = json.decode(res.body);
      if (jsondata['success'] == true) {
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => SuccessDailog(
            heading: 'Success',
            text: 'Ready to Go!!!',
          ),
        );
      } else {
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'Oops',
            text: 'Internal Server Error',
          ),
        );
      }
    } catch (e) {
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
