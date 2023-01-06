import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(AppString.homeScreen),
      ),
    );
  }
}
