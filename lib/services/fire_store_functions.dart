import 'package:cloud_firestore/cloud_firestore.dart';

import '../admin_module/home_feature/data_layer/models/all_notes_model.dart';

class FireStoreFunctions {
  Future<List<AllNotesModel>> getAllNotesService({required userDocumentId}) async {
    try {
      final userDocument =
      await FirebaseFirestore.instance.collection('users').doc(userDocumentId).get();
      if (userDocument.exists) {
        final allNotesCollection = userDocument.reference.collection('allNotes');

        // Query the 'allNotes' subcollection and order the results by 'messageTime'
        final notesQuerySnapshot =
        await allNotesCollection.orderBy('messageTime').get();

        // Extract and return the data as a list of AllNotesModel objects
        final notes =
        notesQuerySnapshot.docs.map((doc) => AllNotesModel.fromJson(doc.data())).toList();

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

  Future<void>addNoteService(AllNotesModel note)async {
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

    /// todo change user uid
    DocumentReference userDocument = usersCollection.doc("AJn92NJE9hh8XUnzRtda");

    CollectionReference allNotesCollection = userDocument.collection('allNotes');

    try {
      // Convert AllNotesModel to a Map
      Map<String, dynamic> noteData = {
        'messageTitle': note.messageTitle,
        'message': note.message,
        'messageID': note.messageID,
        'messageTime':  FieldValue.serverTimestamp(),
      };

      DocumentReference addedNoteRef = await allNotesCollection.add(noteData);

      // Update the 'messageID' field with the generated document ID
      await addedNoteRef.update({'messageID': addedNoteRef.id});

      print("Note added to Firestore successfully!");
    } catch (e) {
      print("Error adding note to Firestore: $e");
    }
  }
}





