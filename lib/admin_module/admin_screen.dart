import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/presentation_layer/components/admin_navigation_bar.dart';
import 'package:side_proj/admin_module/presentation_layer/controller/admin_bloc.dart';

import '../constants/admin_navigation_items.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (BuildContext context) => AdminBloc(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdminNavigationBar(),
            Expanded(
              flex: 16,
              child: BlocBuilder<AdminBloc, AdminStates>(
                builder: (context, state) {
                  int currentIndex = 0;
                  if (state is CurrentPageChangedState) {
                    currentIndex = state.pageNumber;
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        adminScreens[currentIndex],
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
