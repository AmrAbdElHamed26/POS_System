import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_system/admin_module/presentation_layer/components/admin_table.dart';

class AdminHomeScreen extends StatelessWidget {
   AdminHomeScreen({Key? key}) : super(key: key);

  List<String>data = ['amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed','amr' , 'mohamed',];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 15,
            left: screenWidth / 12,
            right: screenWidth / 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              /// TODO change name with name of restaurant
            "Welcome back , Yousef",
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(.6)),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Text(
                  "A clean look at your system ,Today ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  width: screenWidth / 2.2,
                ),
                GestureDetector(
                  /// TODO make an action for this button
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Colors.black,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Add Staff",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey.withOpacity(.6),
                  size: 20,
                ),

                /// TODO change calender
                Text(
                  "Monday, August 22",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(.6),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              children: [AdminTable(currentIcon: Icons.speaker_notes_outlined, data: data , tableName: "Quick Notes", additionState: true),
              const SizedBox(width: 15,),
              AdminTable(currentIcon: Icons.timer_outlined, data: data, tableName: "Current Orders", additionState: false),
              const SizedBox(width: 15,),
              AdminTable(currentIcon: Icons.table_restaurant_outlined, data: data, tableName: "Tables", additionState: true),
            ],)
          ],
        ),
      ),
    );
  }
}
