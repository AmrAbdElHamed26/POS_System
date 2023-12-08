import 'package:flutter/material.dart';
import '../../../home_feature/data_layer/models/all_notes_model.dart';

class NotesTable extends StatelessWidget {
  const NotesTable({Key? key, required this.allNotes}) : super(key: key);

  final AllNotesModel allNotes;

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    final containerWidth = screenSize.width * 0.15;
    final containerHeight = screenSize.height * 0.3;

    return Padding(
      padding: const EdgeInsets.only(left: 10 , right: 10 , top: 5 , bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: containerWidth,
            height: 150,
            decoration: ShapeDecoration(
              color: Color(0xFFF7F7F7),
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
                    "${allNotes.message} ",
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
          const SizedBox(height: 15,),
          SizedBox(
            width: containerWidth,
            child: Center(
              child: Text(
                allNotes.messageTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
