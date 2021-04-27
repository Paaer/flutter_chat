import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserCredential? _userCredential;

  Future<bool> loginWithEmail(
      {required String email, required String password}) async {
    var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (result.user != null) {
      _userCredential = result;
    }
    return result.user != null;
  }

  UserCredential? getUserCredentals() {
    return _userCredential;
  }

  Future signUpWithEmail(
      {required String email, required String password}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (error) {
      return error;
    }
  }
}
