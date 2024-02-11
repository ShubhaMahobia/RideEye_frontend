import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideeye/controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>?> dataFuture;
  final UserController _userController = Get.put(UserController());
  String userName = '';

  @override
  void initState() {
    dataFuture = _userController.fetchingUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                'Welcome back ' + snapshot.data!['fullName'],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }
        return const Center(
          child: Text('Something Went Wrong!'),
        );
      },
    );
  }
}
