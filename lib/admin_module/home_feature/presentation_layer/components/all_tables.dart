import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/months.dart';
import 'admin_table.dart';

class AdminHomeAllTables extends StatelessWidget {
  const AdminHomeAllTables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AdminTable(
                currentIcon: Icons.speaker_notes_outlined,
                data: data,
                tableName: "Quick Notes",
                additionState: true),
            const SizedBox(
              width: 15,
            ),
            AdminTable(
                currentIcon: Icons.timer_outlined,
                data: data,
                tableName: "Current Orders",
                additionState: false),
            const SizedBox(
              width: 15,
            ),
            AdminTable(
                currentIcon: Icons.table_restaurant_outlined,
                data: data,
                tableName: "Tables",
                additionState: false),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TODO change data of text
                Text(
                  "Total Sales",
                  style: TextStyle(color: Colors.grey.withOpacity(.7)),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "10,000",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text("+5%", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
