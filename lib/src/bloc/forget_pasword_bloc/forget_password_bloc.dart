import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/forget_pasword_bloc/forget_password_event.dart';
import 'package:signin_signup_firebase_bloc/src/bloc/forget_pasword_bloc/forget_password_state.dart';
import 'package:signin_signup_firebase_bloc/src/enum/firebase_auth_enum.dart';
import 'package:signin_signup_firebase_bloc/src/services/user_service/user_service.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final UserService userService;
  ForgetPasswordBloc({required this.userService}) : super(ForgetPasswordInitial()) {
    on<ForgetPasswordRequested>((event, emit) async {
      emit(ForgetPasswordInProgress());
      final status = await userService.resetPassword(email: event.email);
      if (status == FirebaseMsgCode.sendPasswordResetEmailSuccess.code) {
        emit(ForgetPasswordSuccess());
      } else if (status == FirebaseMsgCode.userNotFound.code) {
        emit(ForgetPasswordFailure(errorMessage: status));
      }
    });
  }
}
