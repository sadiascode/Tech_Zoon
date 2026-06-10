import 'package:flutter/material.dart';
import 'package:my_app/common/custom_color.dart';
import 'package:my_app/featurs/auth/screen/login_screen.dart';
import 'package:my_app/featurs/profile/screen/myprofile_screen.dart';
import 'package:my_app/featurs/profile/screen/privacy_policy.dart';
import '../../../common/custom_button.dart';
import '../widget/custom_edit.dart';
import '../widget/custom_minibutton.dart';
import '../widget/custom_new.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFF121215),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const MyprofileScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenWidth * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color:  Color(0xFF121215),
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    border: const Border(
                      left: BorderSide(color: AppColors.primary, width: 7),
                      top: BorderSide(color: AppColors.primary, width: 1.5),
                      right: BorderSide(color: AppColors.primary, width: 1.5),
                      bottom: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Builder(
                          builder: (context) {
                                    return Icon(
                                      Icons.person,
                                      size: 40,
                                      color: Colors.white,
                                    );
                              }
                        ),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Expanded(
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.032,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        size: MediaQuery.of(context).size.width * 0.045,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              CustomNew(
                text: "Change Password",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Color(0xFF121215),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomEdit(
                                title: "Current Password",
                                hintText: "**************",
                              ),
                              const SizedBox(height: 20),
                              CustomEdit(
                                title: "New Password",
                                hintText: "**************",
                              ),
                              const SizedBox(height: 20),
                              CustomEdit(
                                title: "Retype New Password",
                                hintText: "**************",
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomMinibutton(
                                text: 'Yes',
                                textcolor: Colors.white,
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: AppColors.primary,
                              ),
                              const SizedBox(width: 7),
                              CustomMinibutton(
                                text: 'No',
                                textcolor: AppColors.primary,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 10),
              CustomNew(
                text: "Edit Profile Info",
                onTap: () {
                },
              ),
              SizedBox(height: 10),

              CustomNew(
                text: "Privacy Policy",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PrivacyPolicy(),
                    ),
                  );
                }
              ),
              SizedBox(height: 10),

              CustomNew(text: "Terms and Conditions"),
              SizedBox(height: 10),

              CustomNew(text: "Delete Account",onTap: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: const Color(0xFF121215),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 35,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Confirm Delete Account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ), const SizedBox(height: 3),

                              const Text(
                                "Are you sure you want to delete your account?",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomEdit(
                                title: "Current Password",
                                hintText: "**************",
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              },),
              SizedBox(height: 10),

              SizedBox(height: 35),
              CustomButton(
                text: "Sign Out",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: const Color(0xFF121215),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 35,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Confirm Sign Out",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "Are you sure you want to sign out?",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(
                                    onPressed: ()  {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const LoginScreen()),
                                    );
                                    },
                                    child: const Text(
                                      "Sign Out",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}