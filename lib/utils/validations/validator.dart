import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideeye/utils/dialogBox/error_dialog.dart';

class Validation {
  bool isValidRegistrationForm(
    String name,
    String email,
    String password,
    String eno,
    String schno,
    String add1,
    String add2,
    String phno,
  ) {
    bool isEmailValid(String email) {
      // Define a regular expression for validating an Email
      final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      );

      // Check if the provided email matches the regular expression
      return emailRegex.hasMatch(email);
    }

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        eno.isEmpty ||
        schno.isEmpty ||
        add1.isEmpty ||
        add2.isEmpty ||
        phno.isEmpty) {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Required Form Fields cannot be empty',
        ),
      );
      return false;
    }
    if (isEmailValid(email) == false) {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Email is not valid',
        ),
      );
      return false;
    }
    if (password.length < 8) {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Password should of at least 8 Character',
        ),
      );
      return false;
    }
    if (phno.length != 10) {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Phone number is not valid',
        ),
      );
      return false;
    }
    if (eno.length > 6) {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Enrollment Number is not valid',
        ),
      );
      return false;
    }
    if (schno.length != 6) {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) => ErrorDialog(
          heading: 'Oops',
          text: 'Scholar Number should be of 6 Digit',
        ),
      );
      return false;
    }
    return true;
  }
}
