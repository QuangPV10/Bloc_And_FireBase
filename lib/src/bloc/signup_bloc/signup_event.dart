import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpInitialize extends SignupEvent {}

class SignUpRequested extends SignupEvent {
  final String fullName;
  final String email;
  final String password;
  const SignUpRequested({required this.email, required this.fullName, required this.password});

  @override
  List<Object> get props => [fullName, email, password];
}
