import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? get user => _firebaseAuth.currentUser;

  static Future<User?> loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();

      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        return userCredential.user;
      }

      return null; // Return null if signIn() returns null
    } catch (e) {
      print("Failed to sign in with Google: $e");
      rethrow; // Rethrow the exception for handling at higher level
    }
  }

  static Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Failed to sign up with email and password: $e");
      rethrow;
    }
  }

  static Future<User?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Failed to sign in with email and password: $e");
      rethrow;
    }
  }

  static Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      print("Failed to sign out: $e");
      rethrow;
    }
  }
}
