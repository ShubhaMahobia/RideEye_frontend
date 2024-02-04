import 'package:flutter_dotenv/flutter_dotenv.dart';

String mainApiUrl = dotenv.env['HOSTED_URL'].toString();
//Authentication Routes -
String signUpApi = '$mainApiUrl/signUp';
String verifyOTP = '$mainApiUrl/verifyOTP';
String loginApi = '$mainApiUrl/login';
