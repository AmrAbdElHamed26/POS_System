import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/components/all_tables.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/components/header_of_home.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_events.dart';
import 'package:side_proj/services/services_locator.dart';
import 'controller/admin_home_bloc.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => getIt<AdminHomeBloc>()
        ..add(GetTimeAndDateUsingTimeStampEvent())
        ..add(GetUserNameEvent())..add(GetAllQuickNotesEvent()) ..add(GetAllQuickToDoListEvent()),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight / 15,
              left: screenWidth / 12,
              right: screenWidth / 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOfAdminHome(screenWidth: screenWidth),
              const AdminHomeAllTables(),
            ],
          ),
        ),
      ),
    );
  }
}
