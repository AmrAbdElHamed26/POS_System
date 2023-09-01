import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_proj/admin_module/presentation_layer/components/admin_navigation_bar.dart';

import '../constants/admin_navigation_items.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdminNavigationBar(),
          Expanded(
            flex: 16,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: adminScreens[0],
            ),
          ),
        ],
      ),
    );
  }
}
