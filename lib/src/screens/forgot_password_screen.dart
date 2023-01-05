import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/button_widget.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const HeaderWidget(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                    child: Column(
                  children: [
                    const SizedBox(height: 30),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(hintText: AppString.email, border: InputBorder.none, filled: true),
                    ),
                    const SizedBox(height: 50),
                    ButtonWidget(
                      text: AppString.buttonSend,
                      onTap: () {},
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
