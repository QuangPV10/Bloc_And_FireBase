import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/login_bloc/login_event.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/login_bloc/login_state.dart';
import 'package:signin_signup_firebase_bloc/src/enum/firebase_auth_enum.dart';
import 'package:signin_signup_firebase_bloc/src/services/user_service/user_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService userService;
  LoginBloc({required this.userService}) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginInProgress());
      final status = await userService.signIn(email: event.email, password: event.password);
      if (status == FirebaseMsgCode.loginSuccess.code) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure());
      }
    });
  }
}
