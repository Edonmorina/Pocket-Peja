import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocket_peja/screen/menu/main_screen.dart';
import 'package:pocket_peja/screen/auth_screens/sign_in.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();

    if (_firebaseUser != null) {
      return MainScreen();
    }
    return SignIn();
  }
}
