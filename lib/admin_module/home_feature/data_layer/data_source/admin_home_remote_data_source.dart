import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/models/all_to_do_list_model.dart';
import 'package:side_proj/constants/months.dart';
import 'package:side_proj/services/fire_store_functions.dart';
import 'package:side_proj/services/save_data.dart';

import '../models/all_notes_model.dart';

abstract class BaseAdminHomeRemoteDataSource {
  Future<String> getDateAndTimeUsingTimeStamp();

  Future<String> getUserName();

  Future<List<AllNotesModel>> getAllNotes();

  Future<List<AllToDoListModel>> getAllToDo();

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
      log("Error: $e");
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

    if(adminScreenData.allQuickNotesChanges == true){
      final result = await FireStoreFunctions().getAllQuickNotesService(userDocumentId: "AJn92NJE9hh8XUnzRtda");
      adminScreenData.allQuickNotes =  List<AllNotesModel>.from(result);
      adminScreenData.allQuickNotesNewState(false);
      return result ;
    }
    else {
      return adminScreenData.allQuickNotes ;
    }

  }

  @override
  Future<List<AllToDoListModel>> getAllToDo() async {

    if(adminScreenData.allQuickToDoListChanges == true){
      final result = await FireStoreFunctions().getAllQuickToDoService(userDocumentId: "AJn92NJE9hh8XUnzRtda");
      adminScreenData.setAllQuickToDoListData =  List<AllToDoListModel>.from(result);
      adminScreenData.setAllQuickToDoListChanges(false);
      return result;
    }
    else {
      return adminScreenData.allQuickToDoList ;
    }
  }

}
