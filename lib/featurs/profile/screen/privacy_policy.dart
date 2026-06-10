import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../../../common/custom_color.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return  SubPageScaffold(
      backgroundColor: const Color(0xFF121215),
      parentTabIndex: 4,
      appBar: AppBar(
        backgroundColor: const Color(0xFF121215),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Effective Date: June 10, 2026",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white.withValues(alpha: 0.7)),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to our electronics store app! We value your privacy. This Privacy Policy explains how we collect, use, and protect your personal information when you use our platform to purchase laptops, mobile phones, and related accessories.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.9)),
            ),
            SizedBox(height: 20),
            Text(
              "1. Information We Collect",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- Personal Information: Name, email address, phone number, and billing/shipping addresses for order fulfillment.\n"
                  "- Payment Data: Transaction history and secure payment processing details (handled by third-party payment gateways).\n"
                  "- Usage Data: Search history, products viewed, cart additions, and app interaction data.\n"
                  "- Device Information: Mobile device type, operating system, and unique device identifiers to optimize the shopping experience.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "2. How We Use Your Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- To process, fulfill, and ship your laptop and mobile orders.\n"
                  "- To provide order tracking updates and customer support.\n"
                  "- To handle warranty claims and device return requests.\n"
                  "- To send promotional offers, new device launch alerts, and newsletters (if opted-in).\n"
                  "- To detect and prevent fraudulent transactions and enhance security.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "3. Data Sharing and Disclosure",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- We do not sell your personal data. We may share it only to fulfill your orders:\n"
                  "  • With courier and logistics partners for product delivery.\n"
                  "  • With payment gateways to securely process transactions.\n"
                  "  • With manufacturers or authorized service centers for warranty processing.\n"
                  "  • With law enforcement if required to comply with legal obligations.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "4. Data Security",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- We implement industry-standard encryption (SSL/TLS) to protect your payment and personal data.\n"
                  "- We do not store full credit card numbers on our servers.\n"
                  "- Our infrastructure undergoes regular security assessments to safeguard against vulnerabilities.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "5. Your Privacy Rights",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- Access & Correction: View and edit your profile and shipping details.\n"
                  "- Deletion: Request the deletion of your account and associated order history (subject to legal retention requirements).\n"
                  "- Opt-Out: Unsubscribe from marketing emails and notifications at any time.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "6. Changes to This Privacy Policy",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- We may update this policy periodically to reflect operational or regulatory changes.\n"
                  "- Significant updates will be communicated via in-app alerts or email.\n"
                  "- Continued use of the app signifies your acceptance of the revised policy.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "7. Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "If you have questions about your privacy or data security:\n\n"
                  "Email: sadia@gmail.com\n"
                  "Support: sadia@gmail.com\n"
                  "Phone: +880 1734-567890\n"
                  "Address: Tech Zone , Dhaka, Bangladesh\n",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}