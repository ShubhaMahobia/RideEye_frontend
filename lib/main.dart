import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rideeye/authentication/login_screen.dart';
import 'package:rideeye/userProfile/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import your token manager or wherever you handle token logic

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: FutureBuilder<bool>(
        future: checkToken(), // Check token asynchronously
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading(); // Show loading indicator while checking token
          } else {
            if (snapshot.hasError || snapshot.data == false) {
              return const LoginScreen(); // Redirect to login screen if token is absent or expired
            } else {
              return const UserProfile(); // Redirect to home screen if token is present and not expired
            }
          }
        },
      ),
      builder: EasyLoading.init(),
    );
  }

  Widget _buildLoading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasToken = false;
    bool isTokenExpired = false;
    var token = prefs.getString('token');
    if (token == null) {
      hasToken = false;
    } else {
      hasToken = true;
      if (JwtDecoder.isExpired(token)) {
        isTokenExpired = true;
      } else {
        isTokenExpired = false;
      }
    }
    return hasToken && !isTokenExpired;
  }
}
