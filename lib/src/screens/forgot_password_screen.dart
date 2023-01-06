import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/forget_pasword_bloc/forget_password_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/forget_pasword_bloc/forget_password_event.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/forget_pasword_bloc/forget_password_state.dart';
import 'package:signin_signup_firebase_bloc/src/constant/app_string.dart';
import 'package:signin_signup_firebase_bloc/src/constant/route_names.dart';
import 'package:signin_signup_firebase_bloc/src/utilities/validator.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/button_widget.dart';
import 'package:signin_signup_firebase_bloc/src/widgets/header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailTextController = TextEditingController();
    final forgetPasswordFormKey = GlobalKey<FormState>();

    bool formValidate() {
      if (forgetPasswordFormKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    }

    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.red,
                  ),
            ),
          ));
        }

        if (state is ForgetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              AppString.sendingSuccess,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ));
          Navigator.of(context).pushNamed(RouteNames.login);
        }
      },
      child: Scaffold(
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
                      key: forgetPasswordFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: emailTextController,
                            validator: (value) {
                              return Validator.isValidEmail(value!) ? null : AppString.invalidEmail;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: AppString.email, border: InputBorder.none, filled: true),
                          ),
                          const SizedBox(height: 50),
                          ButtonWidget(
                            text: AppString.buttonSend,
                            onTap: () {
                              if (formValidate()) {
                                context
                                    .read<ForgetPasswordBloc>()
                                    .add(ForgetPasswordRequested(email: emailTextController.text));
                              }
                            },
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
