import 'package:cloud_firestore/cloud_firestore.dart';

import '../admin_module/home_feature/data_layer/models/all_notes_model.dart';

class FireStoreFunctions {
  Future<List<AllNotesModel>> getAllNotes({required userDocumentId }) async {
    /// todo : change userDocumentId and handle errors
    /// todo : save data using any saver data
    try {

      final userDocument = await FirebaseFirestore.instance.collection('users').doc(userDocumentId).get();
      if (userDocument.exists) {
        final allNotesCollection = userDocument.reference.collection('allNotes');

        final notesQuerySnapshot = await allNotesCollection.get();

        // Extract and return the data as a list of AllNotesModel objects
        final notes = notesQuerySnapshot.docs.map((doc) => AllNotesModel.fromJson(doc.data())).toList();

        print("Notes is $notes");
        return notes;
      } else {
        // Document does not exist, handle this case accordingly
        throw Exception("User document not found");
      }
    } catch (e) {
      // Handle any errors that occur during the process
      print("Error fetching notes: $e");
      return []; // Return an empty list or handle the error differently
    }
  }
}





