import 'package:flutter/material.dart';
import 'package:my_app/common/custom_color.dart';
import 'package:my_app/featurs/auth/screen/signup_screen.dart';
import 'package:my_app/featurs/home/screen/home_screen.dart';
import 'package:my_app/common/app_shell.dart';
import '../../../common/custom_button.dart';
import '../widget/custom_screen.dart';
import '../widget/custom_textfield.dart';
import 'forget_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScreen(
        svgPath: 'assets/logo.png',
        svgHeight: 240,
        svgWidth: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Welcome to Tech Zone",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Enter Email", style: TextStyle(color: Colors.black87)),
            const SizedBox(height: 6),
            CustomTextfield(
              hintText: "Enter Your Email",
            ),
            const SizedBox(height: 12),
            const Text("Password", style: TextStyle(color: Colors.black87)),
            const SizedBox(height: 6),
            CustomTextfield(
              hintText: "Enter Your Password",
              isPassword: true,
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: AppColors.primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Remember Me",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ForgetScreen()),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 14, color: AppColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            loading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
              text: "Sign in",
              onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AppShell(initialIndex: 0)),
              );},
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
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
}