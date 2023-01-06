import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Function() onTap;
  final String image;
  const CardItem({required this.image, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(image),
    );
  }
}
