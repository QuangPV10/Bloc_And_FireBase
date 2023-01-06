import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/signup_bloc/signup_event.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/signup_bloc/signup_state.dart';
import 'package:signin_signup_firebase_bloc/src/enum/firebase_auth_enum.dart';
import 'package:signin_signup_firebase_bloc/src/services/user_service/user_service.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserService userService;
  SignupBloc({required this.userService}) : super(SignupInitial()) {
    on<SignUpInitialize>((event, emit) {
      emit(SignupInitial());
    });

    on<SignUpRequested>((event, emit) async {
      emit(SignupInProgress());
      final status = await userService.signUp(fullName: event.fullName, email: event.email, password: event.password);
      if (status == FirebaseMsgCode.signUpSuccess.code) {
        emit(SignupSuccess());
      } else if (status == FirebaseMsgCode.emailAlreadyInUse.code) {
        emit(SignupFailure(errorMessage: status, email: event.email));
      } else {
        emit(SignupFailure(errorMessage: status));
      }
    });
  }
}
