import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/signup_bloc/signup_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/signup_bloc/signup_event.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/signup_bloc/signup_state.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_color.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';
import 'package:signin_signup_firebase_bloc/src/constant/route_names.dart';
import 'package:signin_signup_firebase_bloc/src/enum/firebase_auth_enum.dart';
import 'package:signin_signup_firebase_bloc/src/utilities/validator.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/button_widget.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/header.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/list_item.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameTextController = TextEditingController();
    final emailTextController = TextEditingController();
    final passwordTextController = TextEditingController();
    final signUpFormKey = GlobalKey<FormState>();

    bool formValidate() {
      if (signUpFormKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    }

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pushReplacementNamed(RouteNames.login);
        }
      },
      child: Scaffold(
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
                      key: signUpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppString.createAccount,
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: fullNameTextController,
                            decoration: const InputDecoration(
                                hintText: AppString.fullName, border: InputBorder.none, filled: true),
                            validator: (value) {
                              return Validator.isValidUserName(value!) ? null : AppString.invalidFullName;
                            },
                          ),
                          const SizedBox(height: 15),
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
                                  hintText: AppString.password,
                                  border: InputBorder.none,
                                  filled: true,
                                  errorStyle: TextStyle(color: Colors.red)),
                              validator: (value) {
                                if (value != null) {
                                  return Validator.isValidPassword(value) ? null : AppString.invalidPassword;
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),
                          BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
                            return Visibility(
                              visible: (state is SignupFailure &&
                                      state.errorMessage == FirebaseMsgCode.emailAlreadyInUse.code)
                                  ? true
                                  : false,
                              child: Row(
                                children: [
                                  Text(
                                    AppString.accountAlreadyExistMsg,
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          color: Colors.red,
                                        ),
                                  ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () {
                                      if (state is SignupFailure &&
                                          state.errorMessage == FirebaseMsgCode.emailAlreadyInUse.code) {
                                        Navigator.pushReplacementNamed(context, RouteNames.login,
                                            arguments: state.email);
                                        context.read<SignupBloc>().add(SignUpInitialize());
                                      }
                                    },
                                    child: Text(
                                      AppString.tryLoginButton,
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 20),
                          BlocBuilder<SignupBloc, SignupState>(
                            builder: (context, state) {
                              return ButtonWidget(
                                  text: AppString.signUp,
                                  onTap: () {
                                    if (formValidate()) {
                                      context.read<SignupBloc>().add(SignUpRequested(
                                          email: emailTextController.text,
                                          fullName: fullNameTextController.text,
                                          password: passwordTextController.text));
                                    }
                                  });
                            },
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 50),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    return Visibility(
                      visible: (state is SignupFailure && state.errorMessage == FirebaseMsgCode.emailAlreadyInUse.code)
                          ? false
                          : true,
                      child: const ListItem(
                        text: AppString.alreadyAccount,
                        isLoginScreen: false,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
