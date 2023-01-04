import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/route_names.dart';
import 'package:signin_signup_firebase_bloc/src/screens/forgot_password_screen.dart';
import 'package:signin_signup_firebase_bloc/src/screens/home_screen.dart';
import 'package:signin_signup_firebase_bloc/src/screens/login_screen.dart';
import 'package:signin_signup_firebase_bloc/src/screens/not_found_screen.dart';
import 'package:signin_signup_firebase_bloc/src/screens/onboarding_screen.dart';
import 'package:signin_signup_firebase_bloc/src/screens/signup_screen.dart';

class RouteController {
  final bool isFirstLaunch;
  RouteController(this.isFirstLaunch);
  MaterialPageRoute routePage(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) {
        switch (settings.name) {
          case RouteNames.initial:
          case RouteNames.onBoarding:
            return const OnBoardingScreen();
          case RouteNames.login:
            return const LoginScreen();
          case RouteNames.signUp:
            return const SignUpScreen();
          case RouteNames.home:
            return const HomeScreen();
          case RouteNames.forgotPassword:
            return const ForgotPasswordScreen();
          default:
            return const NotFoundScreen();
        }
      },
      settings: settings,
    );
  }
}
