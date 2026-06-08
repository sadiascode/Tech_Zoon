import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../common/custom_button.dart';
import '../widget/custom_screen.dart';

class VerifyScreen extends StatefulWidget {
  final String email;

  const VerifyScreen({
    super.key,
    required this.email
  });

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScreen(
        svgPath: 'assets/logo.svg',
        svgHeight: 180,
        svgWidth: 130,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "Check your email",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "We have sent a 6 digit code to ${widget.email}. \nPlease enter it below to verify your identity",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 40,
                activeColor: Colors.green,
                selectedColor: Colors.black,
                inactiveColor: Colors.grey,
              ),
              animationDuration: const Duration(milliseconds: 300),
              appContext: context,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      width: 83,
                      height: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            loading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
              text: "Verify code",
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}