import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_table.dart';

class AdminHomeAllTables extends StatelessWidget {
  const AdminHomeAllTables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Row(
          children: [
            AdminTable(
                currentIcon: Icons.speaker_notes_outlined,
                tableName: "Quick Notes",
                iconState: true,
              numberOfTable: 1,
                additionState: false,
            ),
             SizedBox(
              width: 15,
            ),
            AdminTable(
                currentIcon: Icons.timer_outlined,
                tableName: "Current Orders",
                additionState: false,
            numberOfTable: 2, iconState: true,),
             SizedBox(
              width: 15,
            ),
            AdminTable(
                numberOfTable: 3,
                currentIcon: Icons.table_restaurant_outlined,
                tableName: "Tables",
                additionState: false, iconState: true,),
            AdminTable(
              numberOfTable: 3,
                additionState: false,
                currentIcon: Icons.table_restaurant_outlined,
                tableName: "To Do List",
                iconState: true),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(children: [
          Container(
            width: 350,
            height: 130,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 1.2,
                  blurRadius: .3,
                  offset: Offset.fromDirection(.1),
                )
              ],
              color: Colors.white38.withOpacity(.6),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TODO change data of text
                  Text(
                    "Total Sales",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "10,000",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("+5%", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15,),
          Container(
            width: 350,
            height: 130,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 1.2,
                  blurRadius: .3,
                  offset: Offset.fromDirection(.1),
                )
              ],
              color: Colors.white38.withOpacity(.6),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TODO change data of text
                  Row(
                    children: [
                      Icon(Icons.table_bar_outlined),
                      SizedBox(width: 3,),
                      Text(
                        "Tables",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ],)
      ],
    );
  }
}
