import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Constructor
  FireStoreServices();


  Future<void> addNote(String note) async {
    try {
      // Create a new document in the 'notes' collection
      await _firestore.collection('notes').add({
        'text': note, // Replace 'text' with the field name you want to use
        'timestamp': FieldValue.serverTimestamp(), // You can add a timestamp if needed
      });
    } catch (e) {
      // Handle any errors that occur during the operation
      print('Error adding note: $e');
    }
  }


/*
  Future<List<NoteModel>> getAllNotes() async{
  }*/



  /// todo : implement all functions for fire store and add object of this class to get it services

}