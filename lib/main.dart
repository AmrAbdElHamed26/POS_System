import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/adminStaff/presentation/staff_screen.dart';
import 'package:side_proj/admin_module/adminStaff/presentation/staff_screen_impl.dart';

import 'package:side_proj/features/login/presentation/login_screen.dart';
import 'package:side_proj/features/register/presentation/register_screen.dart';

import 'package:side_proj/services/services_locator.dart';

import 'package:side_proj/shared/bloc_observer.dart';
import 'package:side_proj/shared/cache_helper.dart';
import 'package:side_proj/shared/constants.dart';
import 'admin_module/admin_screen.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: AdminScreen(),

    );
  }
}
