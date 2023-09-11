
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/save_data.dart';
import '../../../home_feature/presentation_layer/controller/admin_home_states.dart';
import '../controller/admin_notes_bloc.dart';
import '../controller/admin_notes_states.dart';
import 'notes_table.dart';

class AllNotes extends StatelessWidget {
  const AllNotes({Key? key , required this.screenSize}) : super(key: key);

  final  Size screenSize;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 12,),
            Text(
              "Pinned",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: screenSize.width * 0.8, // 80% of screen width
          height: screenSize.height * 0.33, // 40% of screen height
          child: BlocBuilder<AdminNotesBloc,AdminNotesStates>(
            builder: (BuildContext context , AdminNotesStates state){
              if(adminScreenData.allNotes.isEmpty){
                return Center(child: Text("You dont have notes"));
              }
              else {
                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      NotesTable(allNotes: adminScreenData.allNotes[index]),
                  itemCount: adminScreenData.allNotes.length,
                  scrollDirection: Axis.horizontal,
                );
              }
            },
          ),
        ),
        const SizedBox(height: 15,),
        const Text("Today" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
      ],
    );
  }
}
