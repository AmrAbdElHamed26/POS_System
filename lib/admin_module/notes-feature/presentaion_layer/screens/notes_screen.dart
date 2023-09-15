import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/services/services_locator.dart';

import '../../../home_feature/data_layer/models/all_notes_model.dart';
import '../components/all_notes.dart';
import '../controller/admin_notes_bloc.dart';
import '../controller/admin_notes_events.dart';

class AdminNotesScreen extends StatelessWidget {
  AdminNotesScreen({Key? key}) : super(key: key);

  final AdminNotesBloc adminNotesBloc = AdminNotesBloc(getIt());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final horizontalPadding = screenSize.width * 0.08;
    final verticalPadding = screenSize.height * 0.07;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          verticalPadding,
          horizontalPadding,
          verticalPadding,
        ),
        child: BlocProvider(
          create: (BuildContext context)=>adminNotesBloc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AllNotes(screenSize: screenSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      AllNotesModel note = const AllNotesModel(
                          messageTitle: "hello user",
                          message: "hello i am amr abd el hamed ",
                          messageID: "a",
                          messageTime: "a");

                      adminNotesBloc.add(AddNoteEvent(note: note));
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),


        ),
      ),
    );
  }
}
