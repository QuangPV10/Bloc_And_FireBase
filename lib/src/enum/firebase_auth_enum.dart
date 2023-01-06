enum FirebaseMsgCode {
  emailAlreadyInUse,
  signUpSuccess,
  signUpError,
  loginSuccess,
  sendPasswordResetEmailSuccess,
  userNotFound
}

extension ThrowValueCode on FirebaseMsgCode {
  String get code {
    switch (this) {
      case FirebaseMsgCode.emailAlreadyInUse:
        return 'email-already-in-use';
      case FirebaseMsgCode.signUpSuccess:
        return 'sign-up-success';
      case FirebaseMsgCode.signUpError:
        return 'sign-up-error';
      case FirebaseMsgCode.loginSuccess:
        return 'login-success';
      case FirebaseMsgCode.sendPasswordResetEmailSuccess:
        return 'send-password-reset-email-success';
      case FirebaseMsgCode.userNotFound:
        return 'user-not-found';
    }
  }
}
