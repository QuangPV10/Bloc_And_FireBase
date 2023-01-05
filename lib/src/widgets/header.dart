import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAsset.header,
        height: 120,
      ),
    );
  }
}
