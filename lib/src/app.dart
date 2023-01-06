import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/forget_pasword_bloc/forget_password_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/login_bloc/login_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/signup_bloc/signup_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/constant/route_names.dart';
import 'package:signin_signup_firebase_bloc/src/routes/route_controller.dart';
import 'package:signin_signup_firebase_bloc/src/services/user_service/user_service_impl.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserServiceImpl userServiceImpl = UserServiceImpl();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupBloc(userService: userServiceImpl),
        ),
        BlocProvider(
          create: (context) => LoginBloc(userService: userServiceImpl),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordBloc(userService: userServiceImpl),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.initial,
        onGenerateRoute: RouteController().routePage,
      ),
    );
  }
}
