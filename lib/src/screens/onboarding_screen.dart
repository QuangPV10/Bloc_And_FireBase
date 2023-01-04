import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_color.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColor.accentColor, AppColor.primaryColor])),
        child: const Center(
          child: CircleAvatar(maxRadius: 65, backgroundImage: AssetImage(AppAsset.logo)),
        ),
      ),
    );
  }
}
