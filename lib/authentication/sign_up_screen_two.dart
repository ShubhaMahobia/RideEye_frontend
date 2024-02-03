import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/utils/buttons/b1.dart';
import 'package:rideeye/utils/buttons/b2.dart';
import 'package:rideeye/utils/textFields/input_text_1.dart';

class SignUpScreenTwo extends StatefulWidget {
  const SignUpScreenTwo({super.key});

  @override
  State<SignUpScreenTwo> createState() => _SignUpScreenTwoState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String selectedValue = 'Option 1';

class _SignUpScreenTwoState extends State<SignUpScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/icons/ride_logo_trsprnt.png',
                  height: MediaQuery.of(context).size.height * 0.1175,
                  width: MediaQuery.of(context).size.width * 0.533,
                ),
                SizedBox(
                  height: 40,
                  width: 280,
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.mochiyPopOne(
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 240,
                  height: 50,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 8,
                    dropdownColor: Colors.blue[50],
                    icon: const Icon(
                      Icons.bus_alert,
                      color: Colors.black,
                    ),
                    menuMaxHeight: 160,
                    style: GoogleFonts.mochiyPopOne(
                        fontSize: 12, color: Colors.black),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Option 1',
                      'Option 2',
                      'Option 3',
                      'Option 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Address Line 1*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Address Line 2*'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: false,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Address Line 3 (Optional)'),
                const SizedBox(
                  height: 20,
                ),
                InputTextOne(
                    isNumber: true,
                    isPassword: false,
                    textEditingController: emailController,
                    hintText: 'Phone Number*'),
                const SizedBox(
                  height: 60,
                ),
                ButtonOne(
                  buttonText: 'Create Account',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Member? ',
                      style: GoogleFonts.mochiyPopOne(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Log in',
                        style: GoogleFonts.mochiyPopOne(
                            fontSize: 12, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
