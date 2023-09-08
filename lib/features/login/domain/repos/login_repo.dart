import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginRepo{
  void user_login(String email,String password,BuildContext context);
  void signInWithGoogle();
}