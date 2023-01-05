import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';

class CardItem extends StatelessWidget {
  final String text;
  const CardItem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final images = [AppAsset.google, AppAsset.facebook, AppAsset.twitter];
    return Column(
      children: [
        Center(
          child: Text(text),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: images.map((image) => Image.asset(image)).toList(),
        )
      ],
    );
  }
}
