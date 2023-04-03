import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/widget/toast_widget.dart';

ValueNotifier<String> currentUsuario = ValueNotifier<String>('');

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ToastWidget _toastWidget = ToastWidget();

  User? usuario;

  bool isAuthenticated = false;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isAuthenticated = user == null ? false : true;
      notifyListeners();
    });
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      isAuthenticated = true;
      notifyListeners();
      return user;
    } on FirebaseAuthException {
      _toastWidget.toast(context, ToastEnum.ERRO.value, ENTRAR_ERRO);
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    isAuthenticated = false;
    notifyListeners();
  }
}
