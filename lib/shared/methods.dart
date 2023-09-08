import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/shared/cache_helper.dart';
import 'package:side_proj/shared/constants.dart';

import '../models/userModel.dart';
Future<userModel> getUserData({
  required String restaurantID,
  required String uId,
}) async {
  final CollectionReference staffCollection =
  FirebaseFirestore.instance
      .collection('users')
      .doc(restaurantID)
      .collection('staff');
  final DocumentReference userDoc = staffCollection.doc(uId);
  final DocumentSnapshot userSnapshot = await userDoc.get();
  late userModel _myData;
  if (userSnapshot.exists) {
    final userData = userSnapshot.data();

    _myData = userModel.fromJson(userData);

  }
  return _myData;
}
void cachingData(userModel userData){
  kUid=userData.uID;
  CacheHelper.saveData(key: 'uId', value:kUid);

  kName=userData.name;
  CacheHelper.saveData(key: 'name', value:kName);

  kEmail=userData.email;
  CacheHelper.saveData(key: 'email', value:kEmail);

  kRole=userData.role;
  CacheHelper.saveData(key: 'role', value:kRole);

  kRestaurantId=userData.restaurantID!;
  CacheHelper.saveData(key: 'restaurantId', value:kRestaurantId);

}