import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/shared/constants.dart';

import '../../../models/userModel.dart';
import '../../../shared/methods.dart';

abstract class RegisterLocalDataSource{
  Future<void> savingLocalData({
   required String restaurantID,
   required String uId,
  });
}
class RegisterLocalDataSourceImpl extends RegisterLocalDataSource{
  @override
  Future<void> savingLocalData({required String restaurantID, required String uId}) async {

    userModel _userData = await getUserData(restaurantID: restaurantID,uId: uId);
    cachingData(_userData);

  }


  
}