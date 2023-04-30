import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:smart_batching/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});
  static const String id = "success-screen";

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5aa443),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/check.png",
            width: 70,
          ),
          Center(
            child: DefaultTextStyle(
              style: GoogleFonts.raleway(
                fontSize: 30.0,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText('Successfully Posted'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
