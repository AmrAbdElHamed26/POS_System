import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:side_proj/admin_module/admin_screen.dart';
import 'package:side_proj/features/login/domain/repos/login_repo.dart';

class LoginRepoImp implements LoginRepo{
  @override
  Future<void> user_login(String email, String password,BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      print('Login is Done');
      //Navigation will change for each user
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminScreen()),
      );
      // navigate to home
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


      // Once signed in, return the UserCredential
     //  return
     await FirebaseAuth.instance.signInWithCredential(credential);
  }

}