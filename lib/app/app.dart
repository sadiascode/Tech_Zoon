import 'package:flutter/material.dart';
import '../featurs/auth/screen/login_screen.dart';
import '../featurs/products/provider/cart_provider.dart';

class TechZoon extends StatelessWidget {
  const TechZoon({super.key});

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      notifier: CartNotifier(),
      child: MaterialApp(
        title: "Tech Zoon",
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}