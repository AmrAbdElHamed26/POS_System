import 'package:flutter/material.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/components/notes_table.dart';
import '../../../services/save_data.dart';

class AdminNotesScreen extends StatelessWidget {
  const AdminNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Calculate the horizontal padding based on screen width
    final horizontalPadding = screenSize.width * 0.08; // 10% of screen width

    // Calculate the vertical padding based on screen height
    final verticalPadding = screenSize.height * 0.07; // 2% of screen height

    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        verticalPadding,
        horizontalPadding,
        verticalPadding,
      ),
      child: Column(
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
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  NotesTable(allNotes: adminScreenData.allNotes[index]),
              itemCount: adminScreenData.allNotes.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
