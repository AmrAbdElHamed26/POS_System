import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/constants/months.dart';

abstract class BaseAdminHomeRemoteDataSource {
  Future<String> getDateAndTimeUsingTimeStamp();
  /// TODO : get user name
  /// TODO : get all notes , current orders and tables data
  /// TODO : get total sales
}

/// TODO : need to handle errors in exceptions only
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
          "${dateTime.day.toString().padLeft(2, '0')},${numberToMonth[dateTime.month.toString().padLeft(2, '0')]} ${dateTime.year} ";

      await docRef.delete();

      return formattedDateTime;
    } catch (e) {
      // Handle any potential errors here
      print("Error: $e");
      return "Error occurred while fetching date and time.";
    }
  }
}
