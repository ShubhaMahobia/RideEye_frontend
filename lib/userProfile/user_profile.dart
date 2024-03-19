import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/controllers/login_controller.dart';
import 'package:rideeye/controllers/user_controller.dart';
import 'package:rideeye/userProfile/edit_profile.dart';
import 'package:rideeye/userProfile/update_password.dart';
import 'package:rideeye/utils/buttons/b3_user_profile.dart';
import 'package:rideeye/utils/snackbar/error_snackbar.dart';
import 'package:rideeye/utils/snackbar/success_snackbar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<Map<String, dynamic>?> dataFuture;
  final UserController _userController = Get.put(UserController());
  
final LoginController _loginController = Get.put(LoginController());

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
            return SafeArea(
                child: Scaffold(
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 12),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Profile',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(
                                snapshot.data!['fullName'],
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data!['email'],
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFC4C4C4)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      UserProfileButton(
                        onTap: () {
                          Get.to(() => const EditProfile(),
                              transition: Transition.noTransition);
                        },
                        buttonText: 'Edit Profile',
                        iconPath: 'assets/images/pencil.png',
                      ),
                      UserProfileButton(
                        onTap: () {
                          setState(() {
                            _loginController.fromEditProfile.value = true;
                          });
                          Get.to(() => const UpdatePassword());
                        },
                        buttonText: 'Change Password',
                        iconPath: 'assets/images/security.png',
                      ),
                      UserProfileButton(
                        onTap: () {
                          SuccessSnackbar(
                            textMsg: "Coming Soon!",
                          ).show(context);
                        },
                        buttonText: 'Change  Route',
                        iconPath: 'assets/images/delivery.png',
                      ),
                      UserProfileButton(
                        onTap: () {
                          ErrorSnackBar(
                            textMsg: "Something Went Wrong!",
                          ).show(context);
                        },
                        buttonText: 'Change  Address',
                        iconPath: 'assets/images/location.png',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.075,
                      ),
                      UserProfileButton(
                        onTap: () {
                          _userController.userLogout();
                        },
                        buttonText: 'Logout',
                        iconPath: 'assets/images/logout.png',
                      )
                    ],
                  ),
                ),
              ),
            ));
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
