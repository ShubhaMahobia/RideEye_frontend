import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rideeye/authentication/login_screen.dart';
import 'package:rideeye/utils/dialogBox/error_dialog.dart';
import 'package:rideeye/utils/dialogBox/logout_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  Map<String, dynamic> user = {};
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController scholarNumberController = TextEditingController();
  TextEditingController enoController = TextEditingController();

  Future<Map<String, dynamic>?> fetchingUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token as String);
    String email = decodedToken['email'];
    try {
      String body = json.encode({
        "email": email,
      });
      http.Response res = await http.post(
        Uri.parse('https://rideeyebackend.azurewebsites.net/api/getUser'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      var jsondata = json.decode(res.body);

      if (jsondata['success'] == true) {
        EasyLoading.dismiss();
        user = jsondata['data'][0];
        return user;
      } else {
        EasyLoading.dismiss();
        showDialog(
          context: Get.context as BuildContext,
          builder: (context) => ErrorDialog(
            heading: 'Oops',
            text: 'User Details are not fetched!!',
          ),
        );
        return null;
      }
    } catch (e) {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: e.toString(),
        ),
      );
    }
    return null;
  }


  void userLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    showDialog(
      context: Get.context as BuildContext,
      builder: (context) => LogoutDialog(
        onTap: () {
          Get.to(() => const LoginScreen(),
              transition: Transition.noTransition);
        },
      ),
    );
  }
}
