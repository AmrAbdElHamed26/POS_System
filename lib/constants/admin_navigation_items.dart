import 'package:flutter/material.dart';

import '../admin_module/presentation_layer/screens/account_screen.dart';
import '../admin_module/home_feature/presentation_layer/home_screen.dart';
import '../admin_module/presentation_layer/screens/menue_screen.dart';
import '../admin_module/presentation_layer/screens/notes_screen.dart';
import '../admin_module/presentation_layer/screens/reports_screen.dart';
import '../admin_module/presentation_layer/screens/staff_screen.dart';
import '../admin_module/presentation_layer/screens/tutorial_screen.dart';


class AdminNavigationItem {
  final String name;
  final IconData icon;

  const AdminNavigationItem(this.name, this.icon);
}

/// TODO: change all icons
List<AdminNavigationItem> adminNavigationItems = const [
  AdminNavigationItem("Home", Icons.home),
  AdminNavigationItem("Staff", Icons.person_outline_sharp,),
  AdminNavigationItem("Menu", Icons.menu,),
  AdminNavigationItem("Reports", Icons.report,),
  AdminNavigationItem("Notes", Icons.speaker_notes,),
  AdminNavigationItem("Account", Icons.account_balance_wallet_outlined,),
  AdminNavigationItem("Tutorial", Icons.science,)
];

List<Widget>adminScreens =  [
  AdminHomeScreen(),
  AdminStaffScreen(),
  AdminMenueScreen(),
  AdminReportsScreen(),
  AdminNotesScreen(),
  AdminAccountScreen(),
  AdminTutorialScreen(),
];