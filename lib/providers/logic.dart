import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;

    notifyListeners();
  }

  Future<void> loginAdmin({
    required String emailAddress,

    required String password,

    required BuildContext context,
  }) async {
    try {
      setLoading(true);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,

        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found for that email.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wrong password provided.')),
        );
      }
    } finally {
      setLoading(false);
    }
  }
}
