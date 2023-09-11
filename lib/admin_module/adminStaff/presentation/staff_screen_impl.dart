import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:side_proj/admin_module/adminStaff/presentation/components/staff_members_table.dart';
import 'package:side_proj/shared/components.dart';

import 'components/add_team_member_table.dart';

class StaffScreenImpl extends StatelessWidget {
  TextEditingController filterController= new TextEditingController();



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:EdgeInsets.only(
            top: screenHeight / 15,
            left: screenWidth / 12,
            right: screenWidth / 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add your team',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.50,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            AddTeamMemberTable(),
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Staff Members',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
               SizedBox(
                 width: screenWidth/3.3,
               ),
                SizedBox(
                  width: 300,
                 
                  child: customizedTextFormField(
                      suffix:Icon(Icons.search_rounded) ,
                      textEditingController: filterController,
                      hintText: 'Filter',
                      textInputType: TextInputType.emailAddress,
                      pre:Icon(FontAwesomeIcons.arrowDownWideShort)
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            StaffMembersTable()
          ],
        ),
      ),
    );
  }
}
