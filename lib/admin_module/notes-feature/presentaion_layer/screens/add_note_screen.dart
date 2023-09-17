import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      color: Colors.green,
      child: Text("hello add note"),
    );
  }
}
