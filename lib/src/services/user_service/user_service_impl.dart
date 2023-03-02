import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signin_signup_firebase_bloc/src/enum/firebase_auth_enum.dart';
import 'package:signin_signup_firebase_bloc/src/services/user_service/user_service.dart';

class UserServiceImpl extends UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return FirebaseMsgCode.sendPasswordResetEmailSuccess.code;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  @override
  Future<String> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return FirebaseMsgCode.loginSuccess.code;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  @override
  Future<String> signUp({required String fullName, required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await addNewUserToFireStore(userCredential.user, fullName);
        return FirebaseMsgCode.signUpSuccess.code;
      } else {
        return FirebaseMsgCode.signUpError.code;
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<void> addNewUserToFireStore(User? firebaseUser, String fullName) async {
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

    userCollection.doc(firebaseUser!.uid).set({
      'id': firebaseUser.uid,
      'email': firebaseUser.email,
      'full_name': fullName,
    });
  }

  // Future signInWithGoogle() async {
  //   final googleUser = await GoogleSignIn().signIn();
  //   final googleAuth = await googleUser!.authentication;

  //   final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  //   return await _auth.signInWithCredential(credential);
  // }
}
