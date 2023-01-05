import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_color.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';
import 'package:signin_signup_firebase_bloc/src/constant/route_names.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/button_widget.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/card_item.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              const HeaderWidget(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppString.titleLogin,
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    const SizedBox(height: 30),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          style: TextButton.styleFrom(),
                          onPressed: () => Navigator.of(context).pushNamed(RouteNames.forgotPassword),
                          child: const Text(
                            AppString.forgetPassword,
                            style: TextStyle(color: Colors.black87, decoration: TextDecoration.underline),
                          )),
                    ),
                    const SizedBox(height: 10),
                    const ButtonWidget(text: AppString.signIn)
                  ],
                )),
              ),
              const SizedBox(height: 50),
              const CardItem(
                text: AppString.signInWith,
                isLoginScreen: true,
              ),
              const SizedBox(height: 60),
              Center(
                  child: RichText(
                text: TextSpan(
                    text: AppString.notAccount,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                          text: AppString.signUp,
                          style: const TextStyle(color: AppColor.buttonColor, fontSize: 17),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).pushNamed(RouteNames.signUp))
                    ]),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
