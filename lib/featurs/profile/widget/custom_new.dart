import 'package:flutter/material.dart';
import 'package:my_app/common/custom_color.dart';

class CustomNew extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const CustomNew({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 0.06,
        width: screenWidth * 0.95,
        decoration: BoxDecoration(
          color:Color(0xFF121215),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: const Border(
            left: BorderSide(color: AppColors.primary, width: 5),
            top: BorderSide(color: AppColors.primary, width: 1),
            right: BorderSide(color: AppColors.primary, width: 1),
            bottom: BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}