import 'package:flutter/material.dart';
import '../auth/login_screen.dart';

class TechZoon extends StatelessWidget {
  const TechZoon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tech Zoon",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}