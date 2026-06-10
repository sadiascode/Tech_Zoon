import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../../../common/custom_color.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      backgroundColor: const Color(0xFF121215),
      parentTabIndex: 4,
      appBar: AppBar(
        backgroundColor: const Color(0xFF121215),
        title: const Text(
          "Terms and Conditions",
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
              "Terms and Conditions",
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
              "Welcome to our electronics store! These Terms and Conditions govern your use of our app and the purchase of laptops, mobiles, and accessories from our platform.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.9)),
            ),
            SizedBox(height: 20),
            Text(
              "1. Acceptance of Terms",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "By downloading, installing, or using our app to purchase products, you agree to these Terms and Conditions. If you do not agree, please do not use our app.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "2. User Accounts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- You must create an account to place orders, track shipments, and request returns.\n"
                  "- You are responsible for maintaining the confidentiality of your login credentials.\n"
                  "- You must provide accurate shipping and billing information.\n"
                  "- We reserve the right to suspend accounts suspected of fraudulent activity.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "3. Product Information & Pricing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- We strive to ensure all laptop and mobile specifications, images, and prices are accurate.\n"
                  "- Prices are subject to change without notice due to market fluctuations.\n"
                  "- In the event of a pricing error, we reserve the right to cancel the order and issue a full refund.\n"
                  "- All products are subject to availability while stocks last.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "4. Orders and Payments",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- By placing an order, you are making an offer to purchase the selected items.\n"
                  "- Orders are confirmed only upon successful payment authorization.\n"
                  "- We accept credit/debit cards, mobile banking, and select cash-on-delivery options.\n"
                  "- You are responsible for any applicable taxes or delivery fees shown at checkout.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "5. Shipping and Delivery",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- Delivery times vary based on your location and the courier service.\n"
                  "- We provide tracking information once the order is dispatched.\n"
                  "- Please inspect the package upon delivery before signing for receipt.\n"
                  "- We are not liable for delays caused by external logistics partners, but we will assist in resolving delivery issues.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "6. Returns, Refunds, and Warranty",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "- We accept returns for damaged, defective, or incorrect items within 7 days of delivery.\n"
                  "- To be eligible for a return, devices must be unused, in their original packaging, with all seals intact.\n"
                  "- Official manufacturer warranties apply to laptops and mobiles as stated on the product page.\n"
                  "- Refunds for eligible returns will be processed to the original payment method within 7-10 business days.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "7. Limitation of Liability",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "To the fullest extent permitted by law, our store shall not be liable for any indirect, incidental, or consequential damages arising from the use of our app, delays in delivery, or the use/inability to use any purchased device.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "8. Changes to Terms",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "We reserve the right to modify these Terms at any time. Changes will be effective immediately upon posting in the app. Continued use of the app constitutes acceptance of any changes.",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 20),
            Text(
              "9. Contact Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 5),
            Text(
              "For questions about these Terms, orders, or warranties:\n\n"
                  "Email: sadia@gmail.com\n"
                  "Phone: +880 1734-567890\n"
                  "Address: Tech Zone , Dhaka, Bangladesh\n\n"
                  "Support Hours: 10:00 AM - 8:00 PM (Daily)",
              style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}