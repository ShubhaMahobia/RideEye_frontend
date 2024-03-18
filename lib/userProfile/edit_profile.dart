import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/controllers/user_controller.dart';
import 'package:rideeye/utils/buttons/b3_user_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final UserController _userController = Get.put(UserController());

  @override
  void initState() {
    _userController.nameController.text = _userController.user['fullName'];
    _userController.phoneController.text = _userController.user['phoneNumber'];
    _userController.scholarNumberController.text =
        _userController.user['scholarNumber'];
    _userController.enoController.text =
        _userController.user['enrollmentNumber'];
    super.initState();
  }


  @override
  void dispose() {
    _userController.nameController.clear();
    _userController.phoneController.clear();
    _userController.scholarNumberController.clear();
    _userController.enoController.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.plusJakartaSans(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile_image.jpg',
                      fit: BoxFit
                          .cover, // Ensure image covers the entire container
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFc3c3c3), width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _userController.nameController,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      decoration:
                          const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your Full Name'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFc3c3c3), width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _userController.phoneController,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      decoration:
                          const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your Phone Number'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFc3c3c3), width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _userController.scholarNumberController,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      decoration:
                          const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your Scholar Number'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFc3c3c3), width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _userController.enoController,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      decoration:
                          const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your Enrollment Number'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.165,
              ),
              UserProfileButton(
                buttonText: 'SAVE',
                onTap: () {},
                iconPath: 'assets/images/save-instagram.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
