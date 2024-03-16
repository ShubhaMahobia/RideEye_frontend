import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideeye/controllers/user_controller.dart';
import 'package:rideeye/utils/buttons/b3_user_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<Map<String, dynamic>?> dataFuture;
  final UserController _userController = Get.put(UserController());

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Profile',
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.lightBlue,
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
                      onTap: () {},
                      buttonText: 'Edit Profile',
                      iconPath: 'assets/images/pencil.png',
                    ),
                    UserProfileButton(
                      onTap: () {},
                      buttonText: 'Change Password',
                      iconPath: 'assets/images/security.png',
                    ),
                    UserProfileButton(
                      onTap: () {},
                      buttonText: 'Change  Route',
                      iconPath: 'assets/images/delivery.png',
                    ),
                    UserProfileButton(
                      onTap: () {},
                      buttonText: 'Change  Address',
                      iconPath: 'assets/images/location.png',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),
                    UserProfileButton(
                      onTap: () {},
                      buttonText: 'Logout',
                      iconPath: 'assets/images/logout.png',
                    )
                  ],
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
