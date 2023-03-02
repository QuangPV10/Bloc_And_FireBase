import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/card_item.dart';

class ListItem extends StatelessWidget {
  final String text;
  final bool isLoginScreen;
  const ListItem({required this.text, required this.isLoginScreen, super.key});

  @override
  Widget build(BuildContext context) {
    final images = [AppAsset.google, AppAsset.facebook, AppAsset.twitter];
    return Column(
      children: [
        Center(
          child: Text(text),
        ),
        SizedBox(height: isLoginScreen ? 25 : 5),
        isLoginScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: images
                    .map((image) => CardItem(
                        image: image,
                        onTap: () {
                          // UserServiceImpl().signInWithGoogle();
                        }))
                    .toList(),
              )
            : TextButton(
                onPressed: () => Navigator.of(context).maybePop(),
                child: const Text(
                  AppString.loginHere,
                  style: TextStyle(color: Colors.green),
                ))
      ],
    );
  }
}
