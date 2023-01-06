abstract class UserService {
  Future<String> signUp({required String fullName, required String email, required String password});
  Future<String> signIn({required String email, required String password});
  Future resetPassword({required String email});
}
