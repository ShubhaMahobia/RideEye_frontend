import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Map<String, dynamic> jwtTokenDecode = JwtDecoder.decode(widget.token);
  //   email = jwtTokenDecode['email'];
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("User's Email ="),
      ),
    );
  }
}
