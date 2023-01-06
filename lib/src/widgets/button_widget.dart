import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_color.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const ButtonWidget({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)]),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
