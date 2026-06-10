import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/featurs/profile/screen/profile_screen.dart';
import '../../../common/app_shell.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_color.dart';
import '../widget/custom_edit.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final ImagePicker _picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      parentTabIndex: 4,
      backgroundColor: const Color(0xFF121215),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFF121215),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.primaryGradient,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  // Pick an image.
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                },
                child: const Text(
                  'Change photo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomEdit(
                title: "Full Name",
                hintText: "Enter your full name",
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Email",
                hintText: "Enter your email",
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Phone",
                hintText: "Enter your phone number",
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Membership Duration",
                hintText: "How long have you been with us?",
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Shipping Address ",
                hintText: "Enter your Shipping Address",
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: " Billing Address",
                hintText: "Enter your billing address",
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Save",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}