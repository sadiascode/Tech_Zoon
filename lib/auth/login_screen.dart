import 'package:flutter/material.dart';

import '../widget/custom_screen.dart';
import '../widget/custom_textfield.dart';
import 'forget_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScreen(
        svgPath: 'assets/logo.png',
        svgHeight: 180,
        svgWidth: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Welcome to Sadia Fitness Zone",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(height: 16),
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
                      activeColor: const Color(0xff3CB189),
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
                    style: TextStyle(fontSize: 14, color: Color(0xff3CB189)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            loading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
              text: "Sign in",
              onTap: login,
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
                      MaterialPageRoute(
                          builder: (_) => const ()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xff3CB189),
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