import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/authenticationService.dart';

class UserController {
  final _auth = AuthenticationService();
  //TODO: fjern afhængighed af UserCredential datatype
  UserCredential? _user;

  Future signUp({required String email, required String password}) async {
    var result = await _auth.signUpWithEmail(email: email, password: password);

    if (result is bool) {
      if (result) {
        print('Hurra, vi har tilmeldt os');
      }
    }
  }

  Future login({required String email, required String password}) async {
    var result = await _auth.loginWithEmail(email: email, password: password);
    if (result) {
      // vi er nu logget ind
      _user = _auth.getUserCredentals();
      print("Du er: $_user");
    }
  }
}
