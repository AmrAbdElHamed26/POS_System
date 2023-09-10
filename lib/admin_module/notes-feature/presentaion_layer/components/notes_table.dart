import 'package:flutter/material.dart';
import '../../../home_feature/data_layer/models/all_notes_model.dart';

class NotesTable extends StatelessWidget {
  const NotesTable({Key? key, required this.allNotes}) : super(key: key);

  final AllNotesModel allNotes;

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    final containerWidth = screenSize.width * 0.18;
    final containerHeight = screenSize.height * 0.5;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: containerWidth,
            height: 170,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allNotes.messageTitle ,
                    maxLines: 1,
                overflow: TextOverflow
                    .ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    allNotes.message ,
                    overflow: TextOverflow
                        .ellipsis,
                    maxLines: 6,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: 50,
            height: 30,
            child: Text(
              allNotes.messageTitle ,
              maxLines: 1,
              overflow: TextOverflow
                  .ellipsis,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

        ],
      ),
    );
  }
}
