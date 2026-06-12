import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';


class CardScreen extends StatefulWidget {

  const CardScreen({super.key,});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      parentTabIndex: 1,
      backgroundColor: const Color(0xFF0D0D0F),
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
          "Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:SingleChildScrollView()
    );
  }
}
