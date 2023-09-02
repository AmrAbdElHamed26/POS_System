import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/shared/bloc_observer.dart';
import 'admin_module/admin_screen.dart';
import 'admin_module/presentation_layer/controller/admin_bloc.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdminScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
