import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/controller/admin_notes_states.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/screens/add_note_screen.dart';
import 'package:side_proj/services/services_locator.dart';

import '../../../home_feature/data_layer/models/all_notes_model.dart';
import '../components/all_notes.dart';
import '../controller/admin_notes_bloc.dart';
import '../controller/admin_notes_events.dart';

class AdminNotesScreen extends StatelessWidget {
  const AdminNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdminNotesBloc adminNotesBloc = getIt();

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
          create: (BuildContext context) =>
              adminNotesBloc..add(GetAllNotesEvent() ),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AllNotes(
                  screenSize: screenSize,
                  nameOfRow: "Pinned",
                ),
                AllNotes(screenSize: screenSize, nameOfRow: "Today"),

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

                        adminNotesBloc.add(ShowAddNoteScreenEvent());
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            BlocBuilder<AdminNotesBloc, AdminNotesStates>(
              builder: (context, state) {
                if (state.showAddNoteScreen == true) {
                  return Center(child: const AddNoteScreen());
                } else
                  return Container();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
