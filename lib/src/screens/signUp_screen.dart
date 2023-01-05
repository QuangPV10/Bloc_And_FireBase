import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_color.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/button_widget.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/card_item.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColor.buttonColor),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppString.createAccount,
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: AppString.fullName, border: InputBorder.none, filled: true),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(hintText: AppString.email, border: InputBorder.none, filled: true),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '⬤',
                      decoration:
                          const InputDecoration(hintText: AppString.password, border: InputBorder.none, filled: true),
                    ),
                    const SizedBox(height: 20),
                    const ButtonWidget(text: AppString.signUp)
                  ],
                )),
              ),
              const SizedBox(height: 50),
              const CardItem(
                text: AppString.alreadyAccount,
                isLoginScreen: false,
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
