import 'package:flutter/material.dart';
import 'package:signin_signup_firebase_bloc/src/constant/route_names.dart';
import 'package:signin_signup_firebase_bloc/src/routes/route_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.initial,
      onGenerateRoute: RouteController().routePage,
    );
  }
}
