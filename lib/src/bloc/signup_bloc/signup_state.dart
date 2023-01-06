import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupInProgress extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String? email;
  final String? errorMessage;
  const SignupFailure({
    this.email,
    this.errorMessage,
  });
  @override
  List<Object> get props => [email!, errorMessage!];
}
