import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:side_proj/shared/constants.dart';

class StaffMembersTable extends StatefulWidget {
  const StaffMembersTable({Key? key}) : super(key: key);

  @override
  State<StaffMembersTable> createState() => _StaffMembersTableState();
}

class _StaffMembersTableState extends State<StaffMembersTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 970,
      height: 300,
      decoration: ShapeDecoration(
        color: Color(0xFFF7F7F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child:SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                .collection('users').doc(kRestaurantId)
                .collection('staff').snapshots(),
                builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((document){
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    document['email'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    document['role'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon(FontAwesomeIcons.ellipsisVertical),
                                  ),

                                ],
                              ),
                            );
                          }).toList(),
                    )
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
