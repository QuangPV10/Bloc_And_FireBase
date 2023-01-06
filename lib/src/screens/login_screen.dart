import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/login_bloc/login_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/login_bloc/login_event.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/login_bloc/login_state.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_color.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';
import 'package:signin_signup_firebase_bloc/src/constant/route_names.dart';
import 'package:signin_signup_firebase_bloc/src/utilities/validator.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/button_widget.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/header.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/list_item.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailTextController = TextEditingController();
    final passwordTextController = TextEditingController();
    final loginFormKey = GlobalKey<FormState>();

    bool formValidate() {
      if (loginFormKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              AppString.loginFailNotification,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.red,
                  ),
            ),
          ));
        }

        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacementNamed(RouteNames.home);
        }
      },
      child: Scaffold(
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
                      key: loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppString.titleLogin,
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: emailTextController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: AppString.email, border: InputBorder.none, filled: true),
                            validator: (value) {
                              return Validator.isValidEmail(value!) ? null : AppString.invalidEmail;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: passwordTextController,
                            obscureText: true,
                            obscuringCharacter: '⬤',
                            decoration: const InputDecoration(
                                hintText: AppString.password, border: InputBorder.none, filled: true),
                            validator: (value) {
                              return Validator.isValidPassword(value!) ? null : AppString.invalidPassword;
                            },
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
                          ButtonWidget(
                            text: AppString.signIn,
                            onTap: () {
                              if (formValidate()) {
                                context.read<LoginBloc>().add(LoginRequested(
                                    email: emailTextController.text, password: passwordTextController.text));
                              }
                            },
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 50),
                const ListItem(
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
                              ..onTap = () {
                                Navigator.of(context).pushNamed(RouteNames.signUp);
                              })
                      ]),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
