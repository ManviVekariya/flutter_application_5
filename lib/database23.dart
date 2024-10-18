// database.dart
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up a user with email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;  // Return the signed-in user
    } catch (e) {
      print('Sign up error: ${e.toString()}');
      return null;  // Return null in case of error
    }
  }
}
