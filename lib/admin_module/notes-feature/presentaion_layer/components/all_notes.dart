
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/save_data.dart';
import '../../../home_feature/presentation_layer/controller/admin_home_states.dart';
import '../controller/admin_notes_bloc.dart';
import '../controller/admin_notes_states.dart';
import 'notes_table.dart';

class AllNotes extends StatelessWidget {
  AllNotes({Key? key , required this.screenSize , required this.nameOfRow}) : super(key: key);

  final Size screenSize;
  final String nameOfRow ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 4,),
            Text(
              nameOfRow,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.33,
          child: BlocBuilder<AdminNotesBloc,AdminNotesStates>(
            builder: (BuildContext context , AdminNotesStates state){
              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                    NotesTable(allNotes: adminScreenData.allNotesData[index]),
                itemCount: adminScreenData.allNotesData.length,
                scrollDirection: Axis.horizontal,
              );
            },
          ),
        ),
      ],
    );
  }
}
