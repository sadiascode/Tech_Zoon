import 'package:flutter/material.dart';
import 'package:my_app/common/custom_color.dart';
import 'package:my_app/featurs/about/widget/stat_card.dart';

import '../widget/contact_item.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = AppColors.primary;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFF121215),
        title: const Text(
          "About",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF121215),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 130,
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Tech Zoon",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Your Tech, Our Trust",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Who We Are",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome to Tech Zoon, the premier marketplace for authentic laptops, mobile devices, and high-performance computing accessories. We are dedicated to bringing you the latest technological innovations with unbeatable reliability, premium customer support, and seamless shopping experiences.",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 25),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatCard(value: "10K+",label: "Customers"),
                      StatCard(value: "50+", label: "Top Brands"),
                      StatCard(value: "100%",label: "Genuine"),
                    ],
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "Why Choose Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildHighlightTile(
                    icon: Icons.verified_user_rounded,
                    title: "100% Genuine Products",
                    description: "Every device is directly sourced from official brand distributors.",
                    color: Colors.tealAccent,
                  ),
                  _buildHighlightTile(
                    icon: Icons.cached_rounded,
                    title: "Easy Replacement & Warranty",
                    description: "Hassle-free return policy and comprehensive brand warranty support.",
                    color: Colors.amberAccent,
                  ),
                  _buildHighlightTile(
                    icon: Icons.local_shipping_rounded,
                    title: "Super Fast Delivery",
                    description: "Safe, secure, and insured delivery right to your doorstep.",
                    color: Colors.lightBlueAccent,
                  ),
                  const SizedBox(height: 25),

                  const Text(
                    "Store Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF121215),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.05),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        ContactItem(
                          icon: Icons.location_on_rounded,
                          title: "Main Branch Address",
                          subtitle: "Banasree, Dhaka, Bangladesh",
                          onTap: () {},
                        ),
                        const Divider(color: Colors.white12, height: 1),
                        ContactItem(
                          icon: Icons.phone_rounded,
                          title: "Hotline Support",
                          subtitle: "+880 1799-999999",
                          onTap: () {},
                        ),
                        const Divider(color: Colors.white12, height: 1),
                        ContactItem(
                          icon: Icons.email_rounded,
                          title: "Official Email",
                          subtitle: "sadia@gmail.com",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightTile({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
