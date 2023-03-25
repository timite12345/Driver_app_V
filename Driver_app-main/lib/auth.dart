import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'function.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  Stream<User?> get onChangeUserStatut {
    return _auth.authStateChanges();
  }

  signin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage(e);
    }
  }

  signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage(e);
    }
  }

  signout() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage(e);
    }
  }

  void errorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        message('AuthError.invalidEmail');
        break;
      case 'user-disabled':
        message(' AuthError.userDisabled');
        break;
      case 'user-not-found':
        message('AuthError.userNotFound');
        break;
      case 'wrong-password':
        message('AuthError.wrongPassword');
        break;
      case 'email-already-in-use':
      case 'account-exists-with-different-credential':
        message('AuthError.emailAlreadyInUse');
        break;
      case 'invalid-credential':
        message('AuthError.invalidCredential');
        break;
      case 'operation-not-allowed':
        message('AuthError.operationNotAllowed');
        break;
      case 'weak-password':
        message('AuthError.weakPassword');
        break;
      case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      default:
        message('AuthError');
    }
  }
}
