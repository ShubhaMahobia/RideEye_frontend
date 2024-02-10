import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rideeye/home_page.dart';
import 'package:rideeye/utils/dialogBox/error_dialog.dart';
import 'package:rideeye/utils/validations/validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var user = {}.obs;

  void userLogin() async {
    if (Validation()
        .isValidLogin(emailController.text, passwordController.text)) {
      try {
        String body = json.encode({
          "email": emailController.text,
          "password": passwordController.text
        });
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

          Get.to(() => const HomePage());
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
}
