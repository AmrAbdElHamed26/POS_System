import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:side_proj/admin_module/admin_screen.dart';
import 'package:side_proj/features/register/domain/repos/register_repo.dart';
import 'package:side_proj/shared/errors/failures.dart';

 class RegisterRepoImpl implements RegisterRepo{
  @override
   void  user_register(String email,String password,BuildContext context)   {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      print('RRRRegistration is done');
      print(value.user!.email.toString());
      //navigate to home as an admin
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminScreen()),
      );
    }
    ).catchError((error){
      print('ERRORRRRRR'+ error.toString());
      RegistrationFailure(error.toString());

    });
  }

}