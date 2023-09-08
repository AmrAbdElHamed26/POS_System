import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/constants/months.dart';
import 'package:side_proj/services/fire_store_functions.dart';

import '../models/all_notes_model.dart';

abstract class BaseAdminHomeRemoteDataSource {
  Future<String> getDateAndTimeUsingTimeStamp();

  Future<String> getUserName();

  Future<List<AllNotesModel>> getAllNotes();

// Add more methods as needed
}

class AdminHomeRemoteDataSource extends BaseAdminHomeRemoteDataSource {
  @override
  Future<String> getDateAndTimeUsingTimeStamp() async {
    try {
      // Add a document with a server timestamp to the 'time' collection
      DocumentReference docRef =
      FirebaseFirestore.instance.collection('time').doc();
      await docRef.set({
        'timeStamp': FieldValue.serverTimestamp(),
      });

      DocumentSnapshot docSnapshot = await docRef.get();
      Timestamp serverTimestamp = docSnapshot['timeStamp'];

      DateTime dateTime = serverTimestamp.toDate();

      String formattedDateTime =
          "${dateTime.day.toString().padLeft(2, '0')}, ${numberToMonth[dateTime.month.toString().padLeft(2, '0')]} ${dateTime.year}";

      await docRef.delete();
      return formattedDateTime;
    } catch (e) {
      // Handle any potential errors here
      print("Error: $e");
      return "Error occurred while fetching date and time.";
    }
  }

  @override
  Future<String> getUserName() async {
    /// TODO: Implement getting user name from Firebase

    return "amr abd elhamed";
  }

  @override
  Future<List<AllNotesModel>> getAllNotes() async {
    final result = FireStoreFunctions().getAllNotes(userDocumentId: "AJn92NJE9hh8XUnzRtda");
    return result;
  }

}
